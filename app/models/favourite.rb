class Favourite < ActiveRecord::Base
	validates :product_id, :uniqueness => { :scope => :user_id}	
	
	belongs_to :user
	belongs_to :product
end