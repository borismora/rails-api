class CreateStoreProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :store_products, :id => false do |t|
      t.integer :id_store
      t.integer :id_product
    end

    execute "ALTER TABLE ONLY store_products ADD PRIMARY KEY (id_store, id_product);"
    execute "ALTER TABLE ONLY store_products ADD FOREIGN KEY (id_store) REFERENCES stores(id_store) ON DELETE CASCADE";
    execute "ALTER TABLE ONLY store_products ADD FOREIGN KEY (id_product) REFERENCES products(id_product) ON DELETE CASCADE";

    execute "INSERT INTO store_products(id_store, id_product) VALUES(1, 1);"
    execute "INSERT INTO store_products(id_store, id_product) VALUES(1, 2);"
    execute "INSERT INTO store_products(id_store, id_product) VALUES(1, 3);"
    execute "INSERT INTO store_products(id_store, id_product) VALUES(2, 1);"
    execute "INSERT INTO store_products(id_store, id_product) VALUES(2, 2);"
    execute "INSERT INTO store_products(id_store, id_product) VALUES(2, 3);"
    execute "INSERT INTO store_products(id_store, id_product) VALUES(3, 1);"
    execute "INSERT INTO store_products(id_store, id_product) VALUES(3, 2);"
    execute "INSERT INTO store_products(id_store, id_product) VALUES(3, 3);"
  end
end
