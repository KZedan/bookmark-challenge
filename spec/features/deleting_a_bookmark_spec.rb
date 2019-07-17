feature "delete a bookmark" do
  scenario "add a bookmark to the database and then delete it" do
    visit('/bookmarks/new')
    fill_in 'url',with: 'http://www.deletebookmark.com'
    fill_in('title', with: "delete bookmark")
    click_button('Submit')
    visit('/bookmarks/delete')
    fill_in('title', with: "delete bookmark")
    click_button('Submit')
    expect(page).not_to have_link("delete bookmark", href: "http://www.deletebookmark.com")
  end
end
