FactoryGirl.define do
  factory :invite do
    after(:build) { create(:user, email: 'recipient@example.com') }

    sender { create(:user) }
    event { create(:event) }
    recipient nil
    email 'recipient@example.com'
    token nil
  end
end
