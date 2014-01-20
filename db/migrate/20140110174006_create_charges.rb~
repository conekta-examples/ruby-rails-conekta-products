class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges, {:id => false} do |t|
      t.string :id, null: false
      t.boolean :livemode
      t.datetime :created_at
      t.string :status
      t.string :currency
      t.text :description
      t.string :reference_id
      t.string :failure_code
      t.string :failure_message
      t.float :amount
      t.string :card_name
      t.string :card_exp_month
      t.string :card_exp_year
      t.string :card_auth_code
      t.string :card_last4
      t.string :card_brand

      t.timestamps
    end
  end
end
