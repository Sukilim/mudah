post '/login' do
 	user = User.authenticate(params[:email], params[:password])

 if user
 	session[:user_id] = user.id
 	redirect "/home"
 else
 	@error = "Woops! We can't find you, please sign up"
	end
end

post '/logout' do
	session[:user_id] = nil
	redirect '/'
end

post '/signup' do
	user = User.find_by(email: params[:email])
	if user.nil?
		user = User.new(name: params[:name], email: params[:email], password: params[:password])
		user.save
		@error = "Signed up. You may now login."
		erb :'static/index'
	else
		@error = "You already exist"
	end
end