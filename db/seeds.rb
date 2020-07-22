# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Planet.destroy_all
Scientist.destroy_all 
Mission.destroy_all

20.times {Planet.create(name: Faker::JapaneseMedia::OnePiece.unique.island,
                        distance_from_earth: Faker::Space.unique.distance_measurement,
                        nearest_star: Faker::Games::Zelda.location)}

15.times {Scientist.create(name: Faker::JapaneseMedia::DragonBall.character,
                           field_of_study: Faker::Educator.subject)}

20.times {Mission.create(name: Faker::Movie.unique.title,
                         scientist: Scientist.all.sample, 
                         planet: Planet.all.sample)}
