class Store < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :phone, presence: true
end
