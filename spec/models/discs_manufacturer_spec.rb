require 'rails_helper'

RSpec.describe DiscsManufacturer, type: :model do
  it {should have_many :discs}
  it {should validate_presence_of :name}
  it {should validate_presence_of :location}
  # it {should validate_presence_of :international}
  it {should validate_presence_of :variety_of_discs}
  it {should allow_value(true).for(:international)}
  it {should allow_value(false).for(:international)}
  it {should_not allow_value(nil).for(:international)}

  describe 'class methods' do
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

      # it 'can order the discs manufacturers by most recent created date' do
      #   visit "/discs_manufacturers/index"
      #
      #   expect(@dm3.name).to appear_before(@dm2.name)
      # end
      #
      # it 'can count the discs made by a disc manufacturer' do
      #   visit "/discs_manufacturers/#{@dm1.id}"
      #
      #   expect(page).to have_content(@dm1.disc_count)
      # end
    end
  end
