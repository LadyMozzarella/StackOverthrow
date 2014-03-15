FactoryGirl.define do
  factory :user do
    username "thefenry"
    password "abcd1234"
  end

  factory :question do
    title Faker::Lorem.word
    text Faker::Lorem.word
  end

  factory :answer do
    text Faker::Lorem.word
    question
  end

  factory :question_vote, class: "Vote" do
    association :votable, :factory => :question
    vote "-1"
  end
   
  factory :answer_vote, class: "Vote" do
    association :votable, :factory => :answer
    # other attributes for answer model
  end

end

