class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, :id => false do |t|
      t.serial :id_order
      t.integer :id_store
      t.integer :total
    end

    execute "ALTER TABLE ONLY orders ADD PRIMARY KEY (id_order);"
    execute "ALTER TABLE ONLY orders ADD FOREIGN KEY (id_store) REFERENCES stores(id_store) ON DELETE CASCADE";
  end
end
