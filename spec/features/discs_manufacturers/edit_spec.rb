require 'rails_helper'

RSpec.describe 'the disc manufacturer edit' do
  before :each do
    @discs_manufacturer = DiscsManufacturer.create!(name: 'Kastaplast', location: 'Stockholm, Sweden', international: true, variety_of_discs: 14)

    visit '/discs_manufacturers'
  end

  it 'links to the edit page' do

    click_button "Edit #{@discs_manufacturer.name}"

    expect(current_path).to eq("/discs_manufacturers/#{@discs_manufacturer.id}/edit")
  end

  it 'can edit the disc manufacturer' do

    expect(page).to have_content('Kastaplas')

    click_button 'Edit Kastaplas'

    fill_in 'Name', with: 'Kastaplast'
    fill_in 'Location', with: 'Stockholm, Sweden'
    check 'International'
    fill_in 'Variety of discs', with: 14
    click_button 'Update Disc Manufacturer'

    expect(page).to have_content('Kastaplast')
  end

  it 'can redirect to the discs manufacturer index page' do
    click_button 'Edit Kastaplas'

    fill_in 'Name', with: 'Kastaplast'
    fill_in 'Location', with: 'Stockholm, Sweden'
    check 'International'
    fill_in 'Variety of discs', with: 14
    click_button 'Update Disc Manufacturer'

    expect(current_path).to eq("/discs_manufacturers")
  end
end
