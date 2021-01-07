class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores, :id => false do |t|
      t.serial :id_store
      t.string :name
      t.text :address
      t.string :email
      t.string :phone
    end

    execute "ALTER TABLE ONLY stores ADD PRIMARY KEY (id_store);"
    execute "ALTER TABLE ONLY public.stores ALTER COLUMN email SET DEFAULT 'francisco.abalan@pjchile.com';"

    execute "INSERT INTO stores(name, address, email, phone) VALUES('PJ Talca', 'Colin', 'pjtalca@gmail.com', 98832833);"
    execute "INSERT INTO stores(name, address, email, phone) VALUES('PJ Santiago', 'Catedral 234', 'pjsantiago@gmail.com', 98823838);"
    execute "INSERT INTO stores(name, address, email, phone) VALUES('PJ Valdivia', 'los lobos 12', 'pjvaldivia@gmail.com', 83247734);"
  end
end
