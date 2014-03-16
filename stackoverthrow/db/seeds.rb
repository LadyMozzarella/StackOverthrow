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

b_q = brittany.questions.create( title: "How exactly does one zig a zig ah?", text: Faker::Lorem.paragraph )
b_q.vote_count = 56
b_q.save
i_q = ivan.questions.create( title: "What is the Sign?", text: "I saw the sign and it opened up my eyes, I saw the sign" )
i_q.vote_count = 88
i_q.save
j_q = jose.questions.create( title: "WHAT WOULDNT YOU DO?", text: "Will you make me some magic with your own two hands? Can you build an emerald city with these grains of sand? Can you give me something I can take home? I can do that!" )
j_q.vote_count = 23
j_q.save
d_q = darren.questions.create( title: "Has Anyone Really Been Far Even as Decided to Use Even Go Want to do Look More Like?", text: Faker::Lorem.paragraph )
d_q.vote_count = 65
d_q.save

questions = [b_q, i_q, j_q, d_q]
users = [brittany, ivan, jose, darren]

8.times do
  a_1 = b_q.answers.new( text: Faker::Lorem.sentence )
  users.sample.answers << a_1
  a_1.vote_count = [*1..100].sample
  a_1.save
  a_2 = i_q.answers.new( text: Faker::Lorem.sentence )
  users.sample.answers << a_2
  a_2.vote_count = [*1..100].sample
  a_2.save
  a_3 = j_q.answers.new( text: Faker::Lorem.sentence )
  users.sample.answers << a_3
  a_3.vote_count = [*1..100].sample
  a_3.save
  a_4 = d_q.answers.new( text: Faker::Lorem.sentence )
  users.sample.answers << a_4
  a_4.vote_count = [*1..100].sample
  a_4.save
end

a_1 = b_q.answers.new( text: "WHAT ARE YOU DOING?" )
darren.answers << a_1
a_1.vote_count = 126
a_1.save
a_2 = i_q.answers.new( text: "No." )
jose.answers << a_2
a_2.vote_count = 432
a_2.save
a_3 = j_q.answers.new( text: "I wouldn't do that." )
brittany.answers << a_3
a_3.vote_count = 500
a_3.save
a_4 = d_q.answers.new( text: "You've got to be kidding me. I've been further even more decided to use even go need to do look more as anyone can. Can you really be far even as decided half as much to use go wish for that? My guess is that when one really been far even as decided once to use even go want, it is then that he has really been far even as decided to use even go want to do look more like. It's just common sense." )
ivan.answers << a_4
a_4.vote_count = 234
a_4.save
