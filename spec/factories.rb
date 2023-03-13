FactoryBot.define do
  factory :test do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    trait :skip_validate do
      to_create {|instance| instance.save(validate: false)}
    end
  end

  factory :user do
    email {'teacher@example.com'}
    password {'12345678'}
    api_token {'testapitoken'}
  end
end