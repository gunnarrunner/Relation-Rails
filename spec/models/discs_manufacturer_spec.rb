require 'rails_helper'

RSpec.describe DiscsManufacturer, type: :model do
  it {should have_many :discs}

  describe 'instance methods' do
    describe '#most_recent_disc_created' do
      before :each do
        @dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
        @dm2 = DiscsManufacturer.create!(name:'Discraft', location:'London, Ontario', international: true, variety_of_discs: 48)
        @dm3 = DiscsManufacturer.create!(name:'Mint', location:'Austin, Texas', international: false, variety_of_discs: 7)
        @disc1 = Disc.create!(name: 'Destroyer', in_production: true, speed: 12, discs_manufacturer_id: @dm1.id)
        @disc2 = Disc.create!(name: 'TeeBird', in_production: true, speed: 7, discs_manufacturer_id: @dm1.id)
        @disc3 = Disc.create!(name: 'Challenger', in_production: true, speed: 12, discs_manufacturer_id: @dm2.id)
        @disc4 = Disc.create!(name: 'Freetail', in_production: true, speed: 10, discs_manufacturer_id: @dm3.id)
        @disc5 = Disc.create!(name: 'Flash', in_production: true, speed: 11, discs_manufacturer_id: @dm2.id)
      end

      it 'indexes discs by most recent creation' do
        expect(@dm1.most_recent_disc_created).to eq('NEWDISC')
      end
    end
  end
end
