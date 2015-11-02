
post '/product' do
	product = Product.find_by(item: params[:item])
	if product.nil?
		new_product = Product.new(user_id: current_user.id, item: params[:item])
		new_product.save
		redirect '/users/:id'
	else
		@error = "Product already exist"
	end
end

get '/product/:id/edit' do
	@product = Product.find(params["id"])
	erb :"static/edit_product"
end

put '/product/:id/edit' do
	edit_product = Product.find(params[:id])
	edit_product.item = params[:product][:item]
	edit_product.save

	redirect "/users/#{current_user.id}"
end

delete '/product/:id' do
	product = Product.find(params[:id])
	product.destroy

	redirect "/users/#{current_user.id}"
end