require 'pg'
require 'databaseconnection'
class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    #if ENV['ENVIRONMENT'] == 'test'
    #  connection = PG.connect(dbname: 'bookmark_manager_test')
  #  else
  #    connection = PG.connect(dbname: 'bookmark_manager')
  #  end

    result = DatabaseConnection.connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark|
       Bookmark.new(id: bookmark['id'], title: bookmark['title'],url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
  #  if ENV['ENVIRONMENT'] == 'test'
  #    connection = PG.connect(dbname: 'bookmark_manager_test')
  #  else
  #    connection = PG.connect(dbname: 'bookmark_manager')
  #  end
  result = DatabaseConnection.connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}','#{title}') RETURNING id, title, url")
  Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(title:)
  #  if ENV['ENVIRONMENT'] == 'test'
  #    connection = PG.connect(dbname: 'bookmark_manager_test')
  #  else
  #    connection = PG.connect(dbname: 'bookmark_manager')
  #  end
  result = DatabaseConnection.connection.exec("DELETE FROM bookmarks id WHERE title = '#{title}' " )
  end

  def self.update(old_title:, new_title:, new_url:)
  #  if ENV['ENVIRONMENT'] == 'test'
  #    connection = PG.connect(dbname: 'bookmark_manager_test')
  #  else
  #    connection = PG.connect(dbname: 'bookmark_manager')
  #  end
    result = DatabaseConnection.connection.exec("UPDATE bookmarks SET title = '#{new_title}', url = '#{new_url}' WHERE title = '#{old_title}' ")
  end
end
