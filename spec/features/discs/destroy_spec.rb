require 'rails_helper'

RSpec.describe 'destroying a disc' do

  it 'can delete a disc from the disc index page' do
    dm = DiscsManufacturer.create!(name:'Discraft', location:'London, Ontario', international: true, variety_of_discs: 48)
    disc = Disc.create!(name: 'Flash', in_production: true, speed: 11, discs_manufacturer_id: dm.id)

    visit '/discs'

    click_button 'Delete'

    expect(current_path).to eq('/discs')
    expect(page).to_not have_content('Flash')
  end
end
