FactoryBot.define do
  factory :weight do
    weight        { Faker::Number.decimal(l_digits: 2, r_digits: 1) }
    recorded_date { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end