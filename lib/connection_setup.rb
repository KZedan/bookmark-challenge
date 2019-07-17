require 'pg'
class ConnectionSetup
  def self.setup
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup("bookmark_manager_test")
    else
      DatabaseConnection.setup("bookmark_manager")
    end
  end
end
