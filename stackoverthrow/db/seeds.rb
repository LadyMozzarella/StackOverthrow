# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


brittany = User.create( username: "brittany", password: "mazza" )
ivan = User.create( username: "ivan", password: "sued" )
jose = User.create( username: "jose", password: "menor" )
darren = User.create( username: "darren", password: "dahl" )

3.times do
  brittany.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.sentence )
  ivan.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.sentence )
  jose.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.sentence )
  darren.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.sentence )
end