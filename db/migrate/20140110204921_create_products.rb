class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :is_subscription

      t.timestamps
    end
  end
end
