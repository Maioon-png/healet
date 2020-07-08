FactoryBot.define do

  factory :user do
    name                  {"abe"}
    email                 { Faker::Internet.email }
    password              {"00000000"}
    password_confirmation {"00000000"}
    start_weight          { "50" }
    target_weight         { "40" }
  end

end