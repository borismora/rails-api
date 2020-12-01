class StoreProduct < ApplicationRecord
    validates :id_store, presence: true
    validates :id_product, presence: true
end
