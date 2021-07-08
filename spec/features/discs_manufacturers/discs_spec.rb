require 'rails_helper'
RSpec.describe 'the discs manufacturers page' do
  before :each do
    @dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
    @dm2 = DiscsManufacturer.create!(name:'Discraft', location:'London, Ontario', international: true, variety_of_discs: 48)
    @dm3 = DiscsManufacturer.create!(name:'Mint', location:'Austin, Texas', international: false, variety_of_discs: 7)
    @disc1 = Disc.create!(name: 'Destroyer', in_production: true, speed: 12, discs_manufacturer_id: @dm1.id)
    @disc2 = Disc.create!(name: 'TeeBird', in_production: true, speed: 7, discs_manufacturer_id: @dm1.id)
    @disc3 = Disc.create!(name: 'Challenger', in_production: true, speed: 12, discs_manufacturer_id: @dm2.id)
    @disc4 = Disc.create!(name: 'Freetail', in_production: true, speed: 10, discs_manufacturer_id: @dm3.id)
    @disc5 = Disc.create!(name: 'Flash', in_production: true, speed: 11, discs_manufacturer_id: @dm2.id)

    visit "/discs_manufacturers/#{@dm1.id}/discs"
  end

  it 'can show discs made by specific discs manufacturers' do
    save_and_open_page
    expect(current_path).to eq("/discs_manufacturers/#{@dm1.id}/discs")
    @dm1.discs.each do |disc|
      expect(page).to have_content(disc.name)
      expect(page).to have_content(disc.speed)
      expect(page).to have_content(disc.in_production)
    end
  end
end
