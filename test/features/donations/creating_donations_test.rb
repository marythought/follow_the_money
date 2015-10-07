require "test_helper"

feature "CreatingDonations" do
  scenario "visitors can add a donation from index" do
    visit root_path
    click_on 'New Donation'
    select donors(:one).name, :from => "donor_id"
    select organizations(:one).name, :from => "organization_id"
    fill_in 'Amount', with: "5000"
    fill_in 'Date', with: '2015-09-17'
    click_button('Add donation')
    page.text_must_include "Donation added!"
    page.text.must_include donors(:one).name
    page.text.must_include organization(:one).name
  end
end

