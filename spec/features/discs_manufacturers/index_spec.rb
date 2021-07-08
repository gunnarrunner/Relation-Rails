require 'rails_helper'
RSpec.describe 'the discs_manufacturers index page' do
  before :each do
    @dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
    @dm2 = DiscsManufacturer.create!(name:'Discraft', location:'London, Ontario', international: true, variety_of_discs: 48)
    @dm3 = DiscsManufacturer.create!(name:'Mint', location:'Austin, Texas', international: false, variety_of_discs: 7)

    visit "/discs_manufacturers"
  end

  it 'can show all the discs manufacturers names' do
    expect(page).to have_content(@dm1.name)
    expect(page).to have_content(@dm2.name)
    expect(page).to have_content(@dm3.name)
  end

  it 'only shows the names and not other information about the discs manufacturers' do
    expect(page).to_not have_content(@dm1.location)
    expect(page).to_not have_content(@dm2.location)
    expect(page).to_not have_content(@dm3.location)
  end
end
