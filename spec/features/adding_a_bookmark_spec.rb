feature "add a bookmark" do
  scenario "add a bookmark to the database" do
    visit('/bookmarks/new')
    fill_in 'url',with: 'http://www.testbookmark.com'
    fill_in('title', with: "Test Bookmark")
    click_button('Submit')
    expect(page).to have_link("Test Bookmark", href: 'http://www.testbookmark.com')
  end
end
