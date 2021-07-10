# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

require 'rails_helper'

RSpec.describe 'destroying a disc manufacturer' do
  it 'can delete a disc manufacturer from the index page' do
    discs_manufacturer = DiscsManufacturer.create!(name: 'Kastaplast', location: 'Stockholm, Sweden', international: true, variety_of_discs: 14)
    visit '/discs_manufacturers'
    click_button 'Delete'
    expect(current_path).to eq('/discs_manufacturers')

  end
end
