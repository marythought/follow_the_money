require "test_helper"

feature "ViewingDonations" do
  scenario "homepage has title and search fields" do
    visit root_path
    page.must_have_content "Follow the Money"
    # add look for search field
  end

  scenario "visitors can search by existing donor" do
    visit root_path
    page.must_have_content "Follow the Money"
    fill_in 'Search Donors', with: donor(:one).name
    click_button('Search Donors')
    page.text.must_include donor(:one).name
  end

  scenario "visitors can search by a non-existant donor & be redirected to donor index page" do
    visit root_path
    page.must_have_content "Follow the Money"
    fill_in 'Search Donors', with: "Not_in_database Foundation"
    click_button('Search Donors')
    page.text.must_include "List of Donors"
  end

  scenario "visitors can search by a non-existant org & be redirected to org index page" do
    visit root_path
    page.must_have_content "Follow the Money"
    fill_in 'Search Donors', with: "Not_in_database Foundation"
    click_button('Search Donors')
    page.text.must_include "List of Donors"
  end
end

