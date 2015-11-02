class Product < ActiveRecord::Base
	validates :item, presence: true
	
	belongs_to :user
	has_many :favourites, dependent: :destroy
end