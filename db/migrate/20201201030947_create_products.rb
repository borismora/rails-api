class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, :id => false do |t|
      t.serial :id_product
      t.serial :sku
      t.string :name
      t.string :typee
      t.integer :price
    end

    execute "ALTER TABLE ONLY products ADD PRIMARY KEY (id_product);"
  end
end
