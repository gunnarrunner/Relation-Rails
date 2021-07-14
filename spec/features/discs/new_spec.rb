require 'rails_helper'

RSpec.describe 'Create a disc' do
  it 'can create a new disc' do
    @dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
    visit "/discs_manufacturers/#{@dm1.id}/discs"
    expect(page).to have_link('Create New Disc')

    click_link("Create New Disc")

    expect(current_path).to eq("/discs_manufacturers/#{@dm1.id}/new")

    fill_in('Name', with: 'Defender')
    check ('In production')
    fill_in('Speed', with: 13)

    click_button('Create New Disc')

    expect(current_path).to eq("/discs_manufacturers/#{@dm1.id}/discs")
    expect(page).to have_content('Defender')
  end
end
