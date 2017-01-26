FactoryGirl.define do
  factory :event do
    users { create_list(:user, 1) }
    time { Faker::Time.forward(365) }
    place "#{Faker::Address.street_address}, #{Faker::Address.city}"
    description { Faker::Hipster.paragraph }
  end
end
