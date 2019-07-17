require 'pg'
class DatabaseConnection
  @connection = nil
  def self.setup (database_name)
    @connection = PG.connect(dbname: database_name)
  end

  def self.connection
    @connection
  end
  def self.query(querystring)
    @connection.exec(querystring)
  end

end
