require 'rails_helper'

RSpec.describe 'the disc edit' do
  before :each do
    @dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
    @disc = Disc.create!(name: 'Destroye', in_production: true, speed: 12, discs_manufacturer_id: "#{@dm1.id}")

    visit '/discs'
  end

  it 'links to the edit page' do

    click_button "Edit #{@disc.name}"

    expect(current_path).to eq("/discs/#{@disc.id}/edit")
  end

  it 'can edit the disc' do

    expect(page).to have_content('Destroye')

    click_button 'Edit Destroye'

    expect(current_path).to eq("/discs/#{@disc.id}/edit")

    fill_in 'Name', with: 'Destroyer'
    check 'In production'
    fill_in 'Speed', with: 12
    click_button 'Update Disc'

    expect(page).to have_content('Destroyer')
  end

  it 'can redirect back to child index after a disc has been updated' do
    click_button 'Edit Destroye'

    expect(current_path).to eq("/discs/#{@disc.id}/edit")

    fill_in 'Name', with: 'Destroyer'
    check 'In production'
    fill_in 'Speed', with: 12
    click_button 'Update Disc'

    expect(current_path).to eq("/discs")
  end
end
