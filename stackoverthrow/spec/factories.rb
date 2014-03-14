FactoryGirl.define do
  factory :user do
    username "thefenry"
    password "abcd1234"
  end

  factory :question do
    title Faker::Lorem.word
    text Faker::Lorem.word
    user
  end

  factory :answer do
    text Faker::Lorem.word
    question
    user
  end
end
