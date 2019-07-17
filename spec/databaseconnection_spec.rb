require 'databaseconnection'

describe DatabaseConnection do
  it "tests connected to right database" do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

    DatabaseConnection.setup('bookmark_manager_test')
  end
  it "receives SQL query string and passes that string to the saved database connection" do
    connection = DatabaseConnection.setup('bookmark_manager_test')
    expect(connection).to receive(:exec).with("query string")
    DatabaseConnection.query("query string")
  end
end
