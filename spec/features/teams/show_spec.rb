require 'rails_helper'
 RSpec.describe 'shows a specific teams page' do
   before :each do
    @team1 = Team.create!(name:"Denver Nuggets", champions: false, wins: 55)
    @team2 = Team.create!(name:"Milwaukee Bucks", champions: true, wins: 60)
    @team3 = Team.create!(name:"LA Lakers", champions: false, wins: 49)
    @team4 = Team.create!(name:"Tampa Bay Buccaneers", champions: true, wins: 12)
    @team5 = Team.create!(name:"Dallas Cowboys", champions: false, wins: 6)
    @team6 = Team.create!(name:"New York Jets", champions: false, wins: 2)
     
    visit "/teams/#{@team1.id}"
   end

   it 'can show specific information on teams show page' do
    expect(page).to have_content(@team1.name)
    expect(page).to have_content(@team1.champions)
    expect(page).to have_content(@team1.wins)
   end

   it 'does not show other teams specific information' do
    expect(page).to_not have_content(@team2.name)
    expect(page).to_not have_content(@team2.champions)
    expect(page).to_not have_content(@team2.wins)
   end
 end