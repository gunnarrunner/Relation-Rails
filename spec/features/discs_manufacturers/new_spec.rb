require 'rails_helper'
RSpec.describe 'Create a Disc Manufacturer' do
  it 'can create a new disc manufacturer'do
    visit '/discs_manufacturers'
    expect(page).to have_link('Create New Disc Manufacturer')

    click_link("Create New Disc Manufacturer")

    expect(current_path).to eq('/discs_manufacturers/new')

    fill_in('Name', with: 'Kastaplast')
    fill_in('Location', with: 'Stockholm, Sweden')
    check 'International'
    fill_in('Variety of discs', with: 14)

    click_button('Create Disc Manufacturer')

    expect(current_path).to eq('/discs_manufacturers')
    expect(page).to have_content('Kastaplast')

  end
end
