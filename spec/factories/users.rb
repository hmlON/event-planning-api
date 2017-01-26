FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'

    factory :recipient do
      initialize_with { User.find_or_create_by(email: 'recipient@example.com') }
    end
  end
end
