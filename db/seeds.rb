Player.destroy_all
Team.destroy_all

Disc.destroy_all
DiscsManufacturer.destroy_all

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

@dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
@dm2 = DiscsManufacturer.create!(name:'Discraft', location:'London, Ontario', international: true, variety_of_discs: 48)
@dm3 = DiscsManufacturer.create!(name:'Mint', location:'Austin, Texas', international: false, variety_of_discs: 7)

@disc1 = @dm1.discs.create!(name: 'Destroyer', in_production: true, speed: 12)
@disc2 = @dm1.discs.create!(name: 'TeeBird', in_production: true, speed: 7)
@disc3 = @dm2.discs.create!(name: 'Challenger', in_production: true, speed: 12)
@disc4 = @dm3.discs.create!(name: 'Freetail', in_production: true, speed: 10)
@disc5 = @dm2.discs.create!(name: 'Flash', in_production: false, speed: 11)
@disc6 = @dm3.discs.create!(name: 'Alpha', in_production: true, speed: 8)
@disc7 = @dm3.discs.create!(name: 'Profit', in_production: false, speed: 2)
@disc8 = @dm2.discs.create!(name: 'Buzz', in_production: true, speed: 2)
@disc9 = @dm1.discs.create!(name: 'Leopard3', in_production: true, speed: 7)