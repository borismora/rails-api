class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details, :id => false do |t|
      t.integer :id_order
      t.integer :id_product
      t.integer :quantity
    end

    execute "ALTER TABLE ONLY order_details ADD PRIMARY KEY (id_order, id_product);"
    execute "ALTER TABLE ONLY order_details ADD FOREIGN KEY (id_order) REFERENCES orders(id_order) ON DELETE CASCADE";
    execute "ALTER TABLE ONLY order_details ADD FOREIGN KEY (id_product) REFERENCES products(id_product) ON DELETE CASCADE";
  end
end
