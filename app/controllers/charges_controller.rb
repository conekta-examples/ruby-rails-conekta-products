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
    if product.is_subscription?
      # Create Plan
      plan = Conekta::Plan.create({
        id: "#{product.name}-#{rand(999999)}",
        name: product.description,
        amount: product.price,
          currency: "MXN",
          interval: "month"
      })
      # Create Customer
      customer = Conekta::Customer.create({
        name: "Juan #{rand(999)}",
        email: "lews.therin@gmail.com",
        phone: "55-5555-5555",
        cards: [charge_params["charge"]["token"]]
      })
      subscription = customer.create_subscription({
        "plan_id" => plan.id
      })
      respond_to do |format|
        if subscription
          format.html { redirect_to products_path, notice: 'Subscription was successfully created.' }
        else
          format.html { render action: 'new' }
        end
      end
    else
      begin
        charge = Conekta::Charge.create({
          amount: product.price.to_i,
          currency: 'MXN',
          description: product.description,
          card: charge_params["charge"]["token"],
          reference_id: "ANYIDCAN-be-ref"
        })
      rescue Conekta::Error => e
        flash[:error] = e.message
        raise e.message
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
