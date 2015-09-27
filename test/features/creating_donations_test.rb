require "test_helper"

feature "CreatingDonations" do

  scenario "visitors can add an existing donor with a valid org" do
    visit donors_path
    click_button('Add donation')
    fill_in 'Donor', with: donors(:one).name
    fill_in 'Organization', with: organization(:one).name
    fill_in 'Amount', with: "5000"
    fill_in 'Date', with: '2015-09-17'
    click_button('Add donation')
    page.text_must_include "Donation successfully created"
    page.text.must_include donors(:one).name
    page.text.must_include organization(:one).name
  end

  scenario "visitors can add a non-existant donor with a valid org" do
    visit donors_path
    click_button('Add donation')
    fill_in 'Donor', with: "Not_in_database Foundation"
    fill_in 'Organization', with: organization(:one).name
    fill_in 'Amount', with: donation(:one).amount
    fill_in 'Date', with: donation(:one).date
    click_button('Add donation')
    page.text_must_include "Donation successfully created"
    page.text.must_include "Not_in_database Foundation"
    page.text.must_include organization(:one).name
  end

  scenario "visitors can add a non-existant donor with a non-existant org" do
    visit donors_path
    click_button('Add donation')
    fill_in 'Donor', with: "Not_in_database Foundation"
    fill_in 'Organization', "Not_in_database Organization"
    fill_in 'Amount', with: donation(:one).amount
    fill_in 'Date', with: donation(:one).date
    click_button('Add donation')
    page.text_must_include "Donation successfully created"
    page.text.must_include "Not_in_database Foundation"
    page.text.must_include "Not_in_database Organization"
  end
end

