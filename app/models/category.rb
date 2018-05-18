class Category < ApplicationRecord
    has_many :guides
    has_many :businesses
    has_many :products

    validates :name,presence: true,
                    uniqueness: true
    validates :slug,presence: true,
                    uniqueness: true
end
