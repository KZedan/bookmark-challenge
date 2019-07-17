require 'sinatra'
require_relative 'lib/bookmark'

class BookmarkApp < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    p @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :new_bookmark
  end

  post '/bookmarks/new' do
    erb :new_bookmark
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/delete' do
    erb :delete_bookmark
  end

  post '/bookmarks/delete' do
    Bookmark.delete(title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/update' do
    erb :update_bookmark
  end

  post '/bookmarks/update' do
    Bookmark.update(old_title: params[:old_title], new_title: params[:new_title], new_url: params[:new_url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
