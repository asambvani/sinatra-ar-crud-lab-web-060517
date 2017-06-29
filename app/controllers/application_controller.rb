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

  get '/posts/:id' do
    @post = Post.find(:id)
    erb :show
  end

  post '/posts' do
    Post.create(params[:post])
    redirect '/posts'
  end

  get '/posts/:id/edit' do
    @post = Post.find(:id)
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(:id)
    @post.update(params[:post])
  end

end
