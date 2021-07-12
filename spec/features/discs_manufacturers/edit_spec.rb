# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'the disc manufacturer edit' do
  it 'links to the edit page' do
    discs_manufacturer = DiscsManufacturer.create!(name: 'Kastaplast', location: 'Stockholm, Sweden', international: true, variety_of_discs: 14)

    visit '/discs_manufacturers'

    click_button "Edit #{discs_manufacturer.name}"

    expect(current_path).to eq("/discs_manufacturers/#{discs_manufacturer.id}/edit")
  end

  it 'can edit the disc manufacturer' do
    discs_manufacturer = DiscsManufacturer.create!(name: 'Kastaplas', location: 'Stockholm, Sweden', international: true, variety_of_discs: 14)

    visit "/discs_manufacturers"
    expect(page).to have_content('Kastaplas')

    click_button 'Edit Kastaplas'

    fill_in 'Name', with: 'Kastaplast'
    fill_in 'Location', with: 'Stockholm, Sweden'
    check 'International'
    fill_in 'Variety of discs', with: 14
    click_button 'Update Disc Manufacturer'

    expect(current_path).to eq("/discs_manufacturers")
    expect(page).to have_content('Kastaplast')
  end

end
