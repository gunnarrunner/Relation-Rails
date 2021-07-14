require 'rails_helper'

RSpec.describe Disc, type: :model do
  it {should belong_to :discs_manufacturer}
  it {should validate_presence_of :name}
  it {should validate_presence_of :speed}
  it {should allow_value(true).for(:in_production)}
  it {should allow_value(true).for(:in_production)}
  it {should allow_value(true).for(:in_production)}

  describe 'class methods' do
    before :each do
      @dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
      @dm2 = DiscsManufacturer.create!(name:'Discraft', location:'London, Ontario', international: true, variety_of_discs: 48)
      @dm3 = DiscsManufacturer.create!(name:'Mint', location:'Austin, Texas', international: false, variety_of_discs: 7)
      @disc1 = Disc.create!(name: 'Destroyer', in_production: true, speed: 12, discs_manufacturer_id: @dm1.id)
      @disc2 = Disc.create!(name: 'TeeBird', in_production: true, speed: 7, discs_manufacturer_id: @dm1.id)
      @disc3 = Disc.create!(name: 'Challenger', in_production: true, speed: 12, discs_manufacturer_id: @dm2.id)
      @disc4 = Disc.create!(name: 'Freetail', in_production: true, speed: 10, discs_manufacturer_id: @dm3.id)
      @disc5 = Disc.create!(name: 'Flash', in_production: false, speed: 11, discs_manufacturer_id: @dm2.id)
    end

    it 'can find discs that are still in production' do
      discs = Disc.discs_in_production

      expect(discs).to eq([@disc1, @disc2, @disc3, @disc4])
    end

    it 'can sort discs in alphabetical order by name' do
      discs = Disc.sort_discs_by_alpha

      expect(discs).to eq([@disc3, @disc1, @disc5, @disc4, @disc2])
    end

    it 'can find discs with speed over a certain threshold' do
      discs = Disc.over_threshold(11)

      expect(discs).to eq([@disc1, @disc3])
    end
  end
end
