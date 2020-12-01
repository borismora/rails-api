class CreateStoreProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :store_products, :id => false do |t|
      t.integer :id_store
      t.integer :id_product
    end

    execute "ALTER TABLE ONLY store_products ADD PRIMARY KEY (id_store, id_product);"
    execute "ALTER TABLE ONLY store_products ADD FOREIGN KEY (id_store) REFERENCES stores(id_store) ON DELETE CASCADE";
    execute "ALTER TABLE ONLY store_products ADD FOREIGN KEY (id_product) REFERENCES products(id_product) ON DELETE CASCADE";
  end
end
