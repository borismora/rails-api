class Store < ApplicationRecord
    validates :id_store, presence: true
    validates :name, presence: true
    validates :address, presence: true
    validates :email, presence: true
    validates :phone, presence: true
end
