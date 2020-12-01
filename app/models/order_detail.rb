class OrderDetail < ApplicationRecord
    validates :id_order, presence: true
    validates :id_product, presence: true
    validates :quantity, presence: true
end
