class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, :id => false do |t|
      t.serial :id_product
      t.string :sku
      t.string :name
      t.string :typee
      t.integer :price
    end

    execute "ALTER TABLE ONLY products ADD PRIMARY KEY (id_product);"

    execute "INSERT INTO products(sku, name, typee, price) VALUES('234234', 'Pizza Mozzarella', 'Pizza', 5444);"
    execute "INSERT INTO products(sku, name, typee, price) VALUES('3233', 'Pizza Pepperonni', 'Pizza', 7555);"
    execute "INSERT INTO products(sku, name, typee, price) VALUES('65656', 'Salsa BBQ', 'Complemento', 344);"
  end
end
