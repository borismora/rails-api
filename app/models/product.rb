class Product < ApplicationRecord
    validates :sku, presence: true
    validates :name, presence: true
    validates :typee, presence: true
    validates :price, presence: true
end
