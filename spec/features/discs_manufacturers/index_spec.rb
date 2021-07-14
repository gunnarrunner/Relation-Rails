require 'rails_helper'
RSpec.describe 'the discs manufacturers index page' do
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
    DiscsManufacturer.all do |discs_manufacturer|
      expect(page).to_not have_content(discs_manufacturer.location)
      expect(page).to_not have_content(discs_manufacturer.international)
      expect(page).to_not have_content(discs_manufacturer.variety_of_discs)
    end
  end

  it 'shows discs manufacturer in order with most recently created first' do
    expect(@dm3.name).to appear_before(@dm2.name)
    expect(@dm2.name).to appear_before(@dm1.name)
  end

  it 'has a button to edit a discs manufacturer' do
    DiscsManufacturer.all do |discs_manufacturer|
      expect(page).to have_button("Edit #{@dm1.name}")
      expect(page).to have_button("Edit #{@dm2.name}")
      expect(page).to have_button("Edit #{@dm3.name}")
    end
  end

  it 'has a button to dele a discs manufacturer' do
    DiscsManufacturer.all do |discs_manufacturer|
      expect(page).to have_button("Delete #{@dm1.name}")
      expect(page).to have_button("Delete #{@dm2.name}")
      expect(page).to have_button("Delete #{@dm3.name}")
    end
  end
end
