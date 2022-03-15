class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :payment_method
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :order_status
      
      t.timestamps
    end
  end
end
