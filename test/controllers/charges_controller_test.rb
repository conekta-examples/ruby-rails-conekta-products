require 'test_helper'

class ChargesControllerTest < ActionController::TestCase
  setup do
    @charge = charges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create charge" do
    assert_difference('Charge.count') do
      post :create, charge: { amount: @charge.amount, card_auth_code: @charge.card_auth_code, card_brand: @charge.card_brand, card_exp_month: @charge.card_exp_month, card_exp_year: @charge.card_exp_year, card_last4: @charge.card_last4, card_name: @charge.card_name, created_at: @charge.created_at, currency: @charge.currency, description: @charge.description, failure_code: @charge.failure_code, failure_message: @charge.failure_message, livemode: @charge.livemode, reference_id: @charge.reference_id, status: @charge.status }
    end

    assert_redirected_to charge_path(assigns(:charge))
  end

  test "should show charge" do
    get :show, id: @charge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @charge
    assert_response :success
  end

  test "should update charge" do
    patch :update, id: @charge, charge: { amount: @charge.amount, card_auth_code: @charge.card_auth_code, card_brand: @charge.card_brand, card_exp_month: @charge.card_exp_month, card_exp_year: @charge.card_exp_year, card_last4: @charge.card_last4, card_name: @charge.card_name, created_at: @charge.created_at, currency: @charge.currency, description: @charge.description, failure_code: @charge.failure_code, failure_message: @charge.failure_message, livemode: @charge.livemode, reference_id: @charge.reference_id, status: @charge.status }
    assert_redirected_to charge_path(assigns(:charge))
  end

  test "should destroy charge" do
    assert_difference('Charge.count', -1) do
      delete :destroy, id: @charge
    end

    assert_redirected_to charges_path
  end
end
