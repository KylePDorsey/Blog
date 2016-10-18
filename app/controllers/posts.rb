get '/posts' do
  @posts = Post.all
  erb :'/posts/index'
end

get '/posts/new' do
  if logged_in?
    erb :'/posts/new'
  else
    @errors = ['You must be logged in to create a post']
    @posts = Post.all
    erb :'/posts/index'
  end
end

get '/posts/:id/edit' do
  @post = Post.find_by(id: params[:id])
  if owner?(@post.user)
    erb :'/posts/edit'
  else
    @errors = ["You must be the author of the post to edit it"]
    redirect '/'
  end
end

put '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  if owner?(@post.user)
    @post.update_attributes(title: params[:title], content: params[:content])
    erb :'/posts/show'
  else
    redirect '/'
  end
end



post '/posts' do
  @post = Post.new(title: params[:title], content: params[:content], author_id: current_user.id)
  if @post.save
     redirect '/' #maybe go to user profile page later
   else
      redirect '/'
   end
end

get '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  if @post
    erb :'/posts/show'
  else
    @posts = Post.all
    @errors = ["Post not found"]
    erb :'/posts/index'
  end
end

delete '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  if owner?(@post.user)
    @post.destroy
    redirect '/'
  else
    @errors = ["You must be the author of this post to delete it"]
    @posts = Post.all
    erb :'/posts/index'
  end
end






