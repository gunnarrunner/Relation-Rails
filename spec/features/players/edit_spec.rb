require 'rails_helper'
RSpec.describe 'Update an existing player on their show page' do
  before :each do
    @team1 = Team.create!(name:"Denver Nuggets", champions: false, wins: 55)
    @team2 = Team.create!(name:"Milwaukee Bucks", champions: true, wins: 60)
    @team3 = Team.create!(name:"LA Lakers", champions: false, wins: 49)
    @team4 = Team.create!(name:"Tampa Bay Buccaneers", champions: true, wins: 12)
    @team5 = Team.create!(name:"Dallas Cowboys", champions: false, wins: 6)
    @team6 = Team.create!(name:"New York Jets", champions: false, wins: 2)

    @player1 = Player.create!(name:"Jamal Murray", age: 24, healthy: false, team_id:@team1.id)
    @player2 = Player.create!(name:"Nikola Jokic", age: 26, healthy: true, team_id:@team1.id)
    @player3 = Player.create!(name:"Michael Porter", age: 23, healthy: true, team_id:@team1.id)
    @player4 = Player.create!(name:"Giannis Antetokounmpo", age: 26, healthy: false, team_id:@team2.id)
    @player5 = Player.create!(name:"Jrue Holiday", age: 31, healthy: true, team_id:@team2.id)
    @player6 = Player.create!(name:"Khris Middleton", age: 29, healthy: true, team_id:@team2.id)
    @player7 = Player.create!(name:"LeBron James", age: 36, healthy: false, team_id:@team3.id)
    @player8 = Player.create!(name:"Anthony Davis", age: 28, healthy: false, team_id:@team3.id)
    @player9 = Player.create!(name:"Alex Caruso", age: 27, healthy: true, team_id:@team3.id)
    @player10 = Player.create!(name:"Rob Gronkowski", age: 32, healthy: true, team_id:@team4.id)
    @player11 = Player.create!(name:"Devin White", age: 23, healthy: true, team_id:@team4.id)
    @player12 = Player.create!(name:"O. J. Howard", age: 26, healthy: false, team_id:@team4.id)
    @player13 = Player.create!(name:"Dak Prescott", age: 27, healthy: false, team_id:@team5.id)
    @player14 = Player.create!(name:"Ezekiel Elliott", age: 25, healthy: false, team_id:@team5.id)
    @player15 = Player.create!(name:"Amari Cooper", age: 27, healthy: false, team_id:@team5.id)
    @player16 = Player.create!(name:"Zach Wilson", age: 21, healthy: true, team_id:@team6.id)
    @player17 = Player.create!(name:"Elijah Moore", age: 21, healthy: true, team_id:@team6.id)
    @player18 = Player.create!(name:"Jamison Crowder", age: 28, healthy: true, team_id:@team6.id)


    visit "/players/#{@player10.id}"
  end
  it 'can click and edit a players and redirect to the players show page' do
    
    click_link("Update #{@player10.name}")
    expect(current_path).to eq("/players/#{@player10.id}/edit")

    
    fill_in("Name", with: 'Rob Gronkowski')
    fill_in("Age", with: '33')
    choose(true)

    click_button('Update Player')

    expect(current_path).to eq("/players/#{@player10.id}")
    expect(page).to have_content("Age: 33")
  end

  it 'can click and edit a player on the team players index page and redirect to the players show page' do
    visit "/teams/#{@team4.id}/players"

    click_button("Edit #{@player10.name}")
    expect(current_path).to eq("/players/#{@player10.id}/edit")

    
    fill_in("Name", with: 'Rob Gronkowski')
    fill_in("Age", with: '33')
    choose(true)

    click_button('Update Player')

    expect(current_path).to eq("/players/#{@player10.id}")
    expect(page).to have_content("Age: 33")
  end
end