require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  patch '/posts/:id' do
    # binding.pry
    @post = Post.find(params[:id])
    @post.update(params[:post])
    redirect "/posts/#{params[:id]}"
  end

  get '/posts/:id' do
    # binding.pry
    @post = Post.find(params[:id])
    erb :show
  end

  post '/posts' do
    Post.create(params[:post])
    redirect '/posts'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @deleted_post = @post.name
    Post.destroy(params[:id])
    erb :delete
  end


end
