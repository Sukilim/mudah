get '/' do
  erb :"static/index"
end

get '/home' do
	@products = Product.all

	erb :"static/home"
end

get '/users/:id' do
	@products = Product.all
	@user_products = current_user.products
	erb :"static/profile"
end


