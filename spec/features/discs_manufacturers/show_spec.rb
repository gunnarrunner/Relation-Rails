require 'rails_helper'
RSpec.describe 'the discs manufacturers show page' do
  before :each do
    @dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
    @dm2 = DiscsManufacturer.create!(name:'Discraft', location:'London, Ontario', international: true, variety_of_discs: 48)
    @dm3 = DiscsManufacturer.create!(name:'Mint', location:'Austin, Texas', international: false, variety_of_discs: 7)
    @disc1 = Disc.create!(name: 'Destroyer', in_production: true, speed: 12, discs_manufacturer_id: @dm1.id)
    @disc2 = Disc.create!(name: 'TeeBird', in_production: true, speed: 7, discs_manufacturer_id: @dm1.id)
    @disc3 = Disc.create!(name: 'Challenger', in_production: true, speed: 12, discs_manufacturer_id: @dm2.id)
    @disc4 = Disc.create!(name: 'Freetail', in_production: true, speed: 10, discs_manufacturer_id: @dm3.id)
    @disc5 = Disc.create!(name: 'Flash', in_production: true, speed: 11, discs_manufacturer_id: @dm2.id)

    visit "/discs_manufacturers/#{@dm1.id}"
  end

  it 'can show specific information on discs manufacturers show page' do
    expect(page).to have_content(@dm1.name)
    expect(page).to have_content(@dm1.location)
    expect(page).to have_content(@dm1.international)
    expect(page).to have_content(@dm1.variety_of_discs)
  end

  it 'does not show specific information of other discs manufacturers' do
    expect(page).to_not have_content(@dm2.name)
    # expect(page).to_not have_content(@dm2.location)
    # save_and_open_page
    # within "section#dm-#{@dm2.id}" do
    #   expect(page).to_not have_content(@dm2.international)
    # end
    # expect(page).to_not have_content(@dm2.variety_of_discs)
  end

  it 'can show number of discs associated with a discs manufacturer' do
    expect(page).to have_content(@dm1.disc_count)
  end

  it 'has a link to the disc manufacturer index at the top of the page' do
    expect(page).to have_link('Disc Manufacturer Index')
    click_on 'Disc Manufacturer Index'
    expect(current_path).to eq('/discs_manufacturers')
  end

  it 'has a link to the disc index at the top of the page' do
    expect(page).to have_link('Disc Index')
    click_on 'Disc Index'
    expect(current_path).to eq('/discs')
  end

  it 'has a link to the discs made by each disc mamufacturer on their show page' do
    expect(page).to have_link('Discs Made By This Manufacturer')
    click_on 'Discs Made By This Manufacturer'
    expect(current_path).to eq("/discs_manufacturers/#{@dm1.id}/discs")
  end
end
