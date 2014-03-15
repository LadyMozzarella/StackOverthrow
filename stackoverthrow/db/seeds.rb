# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


brittany = User.new( username: "brittany", password: "mazza" )
ivan = User.new( username: "ivan", password: "sued" )
jose = User.new( username: "jose", password: "menor" )
darren = User.new( username: "darren", password: "dahl" )

3.times do
  brittany.questions.create( title: Faker::Lorem.word, text: Faker::Lorem.sentence )
  ivan.questions.create( title: Faker::Lorem.word, text: Faker::Lorem.sentence )
  jose.questions.create( title: Faker::Lorem.word, text: Faker::Lorem.sentence )
  darren.questions.create( title: Faker::Lorem.word, text: Faker::Lorem.sentence )
end