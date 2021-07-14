require 'rails_helper'

RSpec.describe 'destroying a disc manufacturer' do
  it 'can delete a disc manufacturer from the disc manufacturer index page' do
    discs_manufacturer = DiscsManufacturer.create!(name: 'Kastaplast', location: 'Stockholm, Sweden', international: true, variety_of_discs: 14)

    visit '/discs_manufacturers'

    click_button 'Delete'

    expect(current_path).to eq('/discs_manufacturers')
    expect(page).to_not have_content('Kastaplast')
  end
end
