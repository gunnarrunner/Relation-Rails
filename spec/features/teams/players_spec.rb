require 'rails_helper'
RSpec.describe 'Can show the players associated with a specific team with a nested URI' do
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
      
    visit "/teams/#{@team1.id}/players"
  end

  it 'can show the players associated with this specific team' do
    team_players1 = [@player1, @player2, @player3]

      expect(current_path).to eq("/teams/#{@team1.id}/players")
      expect(page).to have_content(@team1.name)
    team_players1.each do |player|
      expect(page).to have_content(player.name)
      expect(page).to have_content(player.age)
      expect(page).to have_content(player.healthy)
    end
  end

  it 'does not show any other players on this page that are not associated with this team' do
    team_players2 = [@player4, @player8, @player14]

      expect(page).to have_content(@team1.name)
    team_players2.each do |player|
      expect(page).to_not have_content(player.name)
      # expect(page).to_not have_content(player.age)
      # expect(page).to_not have_content(player.healthy)
    end
  end
end