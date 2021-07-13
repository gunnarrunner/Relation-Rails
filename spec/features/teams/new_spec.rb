require 'rails_helper'
RSpec.describe 'Create a new team to the index' do
  before :each do

    visit "/teams"
  end
  it 'can make click and make a new team and redirect to the index page' do
    
    click_link('Create a New Team')
    expect(current_path).to eq("/teams/new")

    
    fill_in("Name", with: 'Utah Jazz')
    fill_in("Wins", with: '72')
    choose(false)

    click_button('Create Team')

    expect(current_path).to eq('/teams')
    expect(page).to have_content("Utah Jazz")
  end
end