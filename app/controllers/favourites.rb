get '/products/:id/item' do
	@products = Product.find(params[:id])
	
	@favourites = Favourite.select(:user_id).where(product_id: params[:id])
	@user = User.select(:name).where(id: @favourites)
	erb :"static/item_page"
end

post '/products/:id/item' do
@products = Product.find(params[:id])
	@favourites = Favourite.select(:user_id).where(product_id: params[:id])
	@user = User.select(:name).where(id: @favourites)

		favourite_add = Favourite.new(user_id: current_user.id, product_id: params[:id])
		favourite_add.save
		@error = "Added to favourites."
		erb :'static/item_page'

end


get '/favourite' do
	# @products = Product.find(params[:id])
	
	favourites = Favourite.where(user_id: current_user.id).pluck(:product_id)
	@favourite_products = []
	favourites.each do |product_id|
		@favourite_products << Product.find(product_id)
	end
	erb :"static/favourite"
end

delete '/favourite/:id' do
	@fav = Favourite.where(product_id: params[:id]).where(user_id: current_user.id)
	@fav[0].destroy

	redirect "/users/#{current_user.id}"
end


