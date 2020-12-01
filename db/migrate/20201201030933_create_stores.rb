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
  end
end
