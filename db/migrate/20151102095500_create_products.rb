
class CreateProducts < ActiveRecord::Migration
		def change
			create_table :products do |t|
				t.integer :user_id
				t.string :item
			end
		end
end