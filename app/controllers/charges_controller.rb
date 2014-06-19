class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  # GET /charges
  # GET /charges.json
  def index
    @charges = Charge.all
  end

  # GET /charges/1
  # GET /charges/1.json
  def show
  end

  # GET /charges/new
  def new
  end

  # GET /charges/1/edit
  def edit
  end

  # POST /charges
  # POST /charges.json
  def create
    product = Product.find(charge_params["charge"]["product_id"])
    new_charge = if product.is_subscription?
                   {
        amount: product.price.to_i,
        currency: 'MXN',
        description: product.description,
        card: charge_params["charge"]["token"],
        reference_id: "ANYIDCAN-be-ref"
      }
                 else
                   {
        amount: product.price.to_i,
        currency: 'MXN',
        description: product.description,
        card: charge_params["charge"]["token"],
        reference_id: "ANYIDCAN-be-ref"
      }
    end
    begin
      charge = Conekta::Charge.create(new_charge)
    rescue Conekta::Error => e
      flash[:error] = e.message_to_purchaser
      redirect_to buy_product_path(product.id)
      return
    end
    @charge = Charge.new
    @charge.add(charge)
    respond_to do |format|
      if @charge.save
        format.html { redirect_to @charge, notice: 'Charge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @charge }
      else
        format.html { render action: 'new' }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charges/1
  # PATCH/PUT /charges/1.json
  def update
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @charge, notice: 'Charge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.json
  def destroy
    @charge.destroy
    respond_to do |format|
      format.html { redirect_to charges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.permit(charge: [:product_id, :token])
    end
end
