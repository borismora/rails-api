class Order < ApplicationRecord
    validates :id_store, presence: true
    validates :total, presence: true
end
