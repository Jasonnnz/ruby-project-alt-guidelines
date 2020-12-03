class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_order_id
      t.boolean :checked_out, default: false
      t.timestamps 
    end
  end
end
