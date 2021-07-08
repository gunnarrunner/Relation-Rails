require 'rails_helper'
RSpec.describe 'the discs_manufacturers index page' do
  before :each do
    @dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
    @dm2 = DiscsManufacturer.create!(name:'Discraft', location:'London, Ontario', international: true, variety_of_discs: 48)
    @dm3 = DiscsManufacturer.create!(name:'Mint', location:'Austin, Texas', international: false, variety_of_discs: 7)

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
    expect(page).to_not have_content(@dm2.location)
    expect(page).to_not have_content(false)#(@dm2.international)
    expect(page).to_not have_content(@dm2.variety_of_discs)
  end
end
