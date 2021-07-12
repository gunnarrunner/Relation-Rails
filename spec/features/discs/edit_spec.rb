# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'the disc edit' do
  it 'links to the edit page' do
    dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
    disc = Disc.create!(name: 'Destroyer', in_production: true, speed: 12, discs_manufacturer_id: "#{dm1.id}")

    visit '/discs'

    click_button "Edit #{disc.name}"

    expect(current_path).to eq("/discs/#{disc.id}/edit")
  end

  it 'can edit the disc' do
    dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
    disc = Disc.create!(name: 'Destroye', in_production: true, speed: 12, discs_manufacturer_id: "#{dm1.id}")

    visit "/discs"

    expect(page).to have_content('Destroye')

    click_button 'Edit Destroye'

    expect(current_path).to eq("/discs/#{disc.id}/edit")

    fill_in 'Name', with: 'Destroyer'
    check 'In production'
    fill_in 'Speed', with: 12
    click_button 'Update Disc'

    expect(current_path).to eq("/discs")
    expect(page).to have_content('Destroyer')
  end
end
