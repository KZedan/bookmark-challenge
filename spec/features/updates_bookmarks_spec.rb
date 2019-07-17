feature 'Update bookmarks' do
  scenario 'updates bookmarks' do
    visit('/bookmarks/new')
    fill_in 'url',with: 'http://www.testbookmark.com'
    fill_in('title', with: "Test Bookmark")
    click_button('Submit')
    visit('bookmarks/update')
    fill_in 'old_title', with: 'Test Bookmark'
    fill_in 'new_title', with: 'Updated Bookmark'
    fill_in 'new_url', with: 'http://www.updatedurl.com'
    click_button('Submit')
    expect(page).to have_link("Updated Bookmark", href: 'http://www.updatedurl.com')
  end
end
