require 'rails_helper'
RSpec.describe 'Create a Disc Manufacturer' do
  before :each do
    visit '/discs_manufacturers'
  end

  it 'can create a new disc manufacturer'do

    expect(page).to have_link('Create New Disc Manufacturer')
  end

  it 'can link to form to create a new disc manufacturer' do

    click_link("Create New Disc Manufacturer")

    expect(current_path).to eq('/discs_manufacturers/new')
  end

  it 'can create a new disc manufacturer' do

    click_link("Create New Disc Manufacturer")

    fill_in('Name', with: 'Kastaplast')
    fill_in('Location', with: 'Stockholm, Sweden')
    check 'International'
    fill_in('Variety of discs', with: 14)

    click_button('Create Disc Manufacturer')

    expect(page).to have_content('Kastaplast')
  end

  it 'can redirect back to discs manufacturer index after a new instance is created' do
    click_link("Create New Disc Manufacturer")

    fill_in('Name', with: 'Kastaplast')
    fill_in('Location', with: 'Stockholm, Sweden')
    check 'International'
    fill_in('Variety of discs', with: 14)

    click_button('Create Disc Manufacturer')

    expect(current_path).to eq('/discs_manufacturers')
  end
end
