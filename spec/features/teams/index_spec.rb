require 'rails_helper'
 RSpec.describe 'the teams index page' do
  before :each do
  @team1 = Team.create!(name:"Denver Nuggets", champions: false, wins: 55)
  @team2 = Team.create!(name:"Milwaukee Bucks", champions: true, wins: 60)
  @team3 = Team.create!(name:"LA Lakers", champions: false, wins: 49)
  @team4 = Team.create!(name:"Tampa Bay Buccaneers", champions: true, wins: 12)
  @team5 = Team.create!(name:"Dallas Cowboys", champions: false, wins: 6)
  @team6 = Team.create!(name:"New York Jets", champions: false, wins: 2)
    
  visit "/teams"
  end
  it 'can show all the teams names' do
    expect(current_path).to eq("/teams")
    expect(page).to have_content(@team1.name)
    expect(page).to have_content(@team2.name)
    expect(page).to have_content(@team3.name)
    expect(page).to have_content(@team4.name)
    expect(page).to have_content(@team5.name)
    expect(page).to have_content(@team6.name)
  end

  it 'only shows the names and not other information about the teams' do
    expect(page).to_not have_content(@team1.wins)
    expect(page).to_not have_content(@team2.wins)
    expect(page).to_not have_content(@team3.wins)
    expect(page).to_not have_content(@team4.wins)
    expect(page).to_not have_content(@team5.wins)
    expect(page).to_not have_content(@team6.wins)
  end
 end