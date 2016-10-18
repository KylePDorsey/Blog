get '/users/new' do
  erb :'/users/new'
end


post '/users' do
  user = User.new(username: params[:username], password: params[:password])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  if logged_in?
    @user = User.find_by(id: params[:id])
      erb :'/users/show'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Username and/or Password are Incorrect!"]
    erb :'/users/login'
  end
end
