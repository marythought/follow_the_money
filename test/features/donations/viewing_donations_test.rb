require "test_helper"

feature "ViewingDonations" do
  scenario "homepage has title" do
    visit root_path
    page.must_have_content "Follow the Money"
    # add look for search field
  end

  scenario "visitors can browse by existing donor" do
    visit root_path
    click_on 'Browse Donors'
    page.text.must_include donors(:one).name
  end

  scenario "visitors can browse by existing organization" do
    visit root_path
    click_on 'Browse Organizations'
    page.text.must_include organizations(:one).name
  end
end

