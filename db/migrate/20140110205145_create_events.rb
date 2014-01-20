class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, {:id => false} do |t|
      t.string :id, null: false
      t.string :type
      t.datetime :created_at
      t.string :charge_id

      t.timestamps
    end
  end
end
