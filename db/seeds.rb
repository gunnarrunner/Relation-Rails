# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Disc.destroy_all
DiscsManufacturer.destroy_all

@dm1 = DiscsManufacturer.create!(name:'Innova', location:'Ontario,California', international: true, variety_of_discs: 90)
@dm2 = DiscsManufacturer.create!(name:'Discraft', location:'London, Ontario', international: true, variety_of_discs: 48)
@dm3 = DiscsManufacturer.create!(name:'Mint', location:'Austin, Texas', international: false, variety_of_discs: 7)

@disc1 = @dm1.discs.create!(name: 'Destroyer', in_production: true, speed: 12)
@disc2 = @dm1.discs.create!(name: 'TeeBird', in_production: true, speed: 7)
@disc3 = @dm2.discs.create!(name: 'Challenger', in_production: true, speed: 12)
@disc4 = @dm3.discs.create!(name: 'Freetail', in_production: true, speed: 10)
@disc5 = @dm2.discs.create!(name: 'Flash', in_production: false, speed: 11)
