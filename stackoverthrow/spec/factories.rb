FactoryGirl.define do
  factory :user do
    username "thefenry"
    password "abcd1234"
  end

  factory :question do
    title "Dr. Who?"
    text "Dr. You!"
  end
end
