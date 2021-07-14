require 'rails_helper'
RSpec.describe 'the discs index page' do
  before :each do
    @dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
    @dm2 = DiscsManufacturer.create!(name:'Discraft', location:'London, Ontario', international: true, variety_of_discs: 48)
    @dm3 = DiscsManufacturer.create!(name:'Mint', location:'Austin, Texas', international: false, variety_of_discs: 7)
    @disc1 = Disc.create!(name: 'Destroyer', in_production: true, speed: 12, discs_manufacturer_id: @dm1.id)
    @disc2 = Disc.create!(name: 'TeeBird', in_production: true, speed: 7, discs_manufacturer_id: @dm1.id)
    @disc3 = Disc.create!(name: 'Challenger', in_production: true, speed: 12, discs_manufacturer_id: @dm2.id)
    @disc4 = Disc.create!(name: 'Freetail', in_production: true, speed: 10, discs_manufacturer_id: @dm3.id)
    @disc5 = Disc.create!(name: 'Flash', in_production: false, speed: 11, discs_manufacturer_id: @dm2.id)

    visit "/discs"
  end

  it 'can show all the discs names and their attributes' do
    expect(current_path).to eq('/discs')
    Disc.where(in_production: true).each do |disc|
      expect(page).to have_content(disc.name)
      expect(page).to have_content(disc.speed)
      expect(page).to have_content(disc.in_production)
    end
  end

  it 'only shows discs where In Production column equals true' do
    expect(page).to_not have_content('Flash')
  end

  it 'has a button to edit a discs manufacturer' do
    Disc.all do |disc|
      expect(page).to have_button("Edit #{@disc1.name}")
      expect(page).to have_button("Edit #{@disc2.name}")
      expect(page).to have_button("Edit #{@disc3.name}")
      expect(page).to have_button("Edit #{@disc4.name}")
      expect(page).to have_button("Edit #{@disc5.name}")
    end
  end

  it 'has a button to delete a discs manufacturer' do
    Disc.all do |disc|
      expect(page).to have_button("Delete #{@disc1.name}")
      expect(page).to have_button("Delete #{@disc2.name}")
      expect(page).to have_button("Delete #{@disc3.name}")
      expect(page).to have_button("Delete #{@disc4.name}")
      expect(page).to have_button("Delete #{@disc5.name}")
    end
  end
end
