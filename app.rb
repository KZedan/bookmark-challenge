require 'sinatra'
require_relative 'lib/bookmark'

class BookmarkApp < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
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

  run! if app_file == $0
end
