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
    expect(page).to_not have_content("Teams wins: #{@team1.wins}")
    expect(page).to_not have_content("Teams wins: #{@team2.wins}")
    expect(page).to_not have_content("Teams wins: #{@team3.wins}")
    expect(page).to_not have_content("Teams wins: #{@team4.wins}")
    expect(page).to_not have_content("Teams wins: #{@team5.wins}")
  end

  it 'can order the teams by created at' do

    expect(@team6.name).to appear_before(@team1.name)
  end

  it 'can click on the edit button and be taken to an edit page' do
    click_button("Edit #{@team2.name}")

    expect(current_path).to eq("/teams/#{@team2.id}/edit")
  end

  it 'can click the delete button and be taken to the index page and not see that teams a name' do
    click_button("Delete the #{@team6.name}")

    expect(current_path).to eq("/teams")
    expect(page).to_not have_content("#{@team6.name}")
  end
 end