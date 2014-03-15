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

first_q = brittany.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.paragraph )
second_q = ivan.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.paragraph )
third_q = jose.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.paragraph )
fourth_q = darren.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.paragraph )

8.times do
  a_1 = first_q.answers.new( text: Faker::Lorem.sentence )
  brittany.answers << a_1
  a_2 = second_q.answers.new( text: Faker::Lorem.sentence )
  ivan.answers << a_2
  a_3 = third_q.answers.new( text: Faker::Lorem.sentence )
  jose.answers << a_3
  a_4 = fourth_q.answers.new( text: Faker::Lorem.sentence )
  darren.answers << a_4
end

3.times do
  brittany.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.sentence )
  ivan.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.sentence )
  jose.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.sentence )
  darren.questions.create( title: Faker::Lorem.sentence, text: Faker::Lorem.sentence )
end