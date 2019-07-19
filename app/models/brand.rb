class Brand < ApplicationRecord
	has_many :brand_categories
    has_many :categories, through: :brand_categories
end