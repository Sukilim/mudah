
class CreateFavourites < ActiveRecord::Migration
		def change
			create_table :favourites do |t|
				t.integer :user_id
				t.integer :product_id
			end
		end
end