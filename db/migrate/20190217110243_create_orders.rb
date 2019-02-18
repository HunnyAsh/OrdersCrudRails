class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :purchased_by
      t.integer :product_price

      t.timestamps
    end
  end
end
