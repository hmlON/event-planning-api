FactoryGirl.define do
  factory :message do
    text { Faker::Hipster.paragraph }
    user { create(:user) }
    event { create(:event) }
  end
end
