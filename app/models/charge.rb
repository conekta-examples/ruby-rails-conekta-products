class Charge < ActiveRecord::Base
  self.primary_key = "id"

  def add(charge)
    if charge.class.to_s == "Conekta::Charge"
      self.id= charge.id
      self.livemode= charge.livemode
      self.created_at= charge.created_at
      self.status= charge.status
      self.currency= charge.currency
      self.description= charge.description
      self.reference_id= charge.reference_id
      self.failure_code= charge.failure_code
      self.failure_message= charge.failure_message
      self.amount= charge.amount
      self.card_name= charge.payment_method.name
      self.card_exp_month= charge.payment_method.exp_month
      self.card_exp_year= charge.payment_method.exp_year
      self.card_auth_code= nil
      self.card_last4= charge.payment_method.last4
      self.card_brand= charge.payment_method.brand
    else
      raise "This is not a Conekta::Charge object"
    end
  end
end

