class User < ActiveRecord::Base
	validates :name, presence: true 
	validates :email, format: {with: /.+@.+[.][^.]{2,}\z/}
	validates :password, :length => { :in => 8..20 }

	has_many :products, dependent: :destroy
	has_many :favourites, dependent: :destroy

	def self.authenticate(email, password)
		user = User.find_by(email: email)

		if user && user.password == password
			return user
		end

		nil
	end
end