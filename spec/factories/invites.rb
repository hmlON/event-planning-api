FactoryGirl.define do
  factory :invite do
    before(:create) { create(:user, email: 'recipient@example.com') }

    sender { create(:user) }
    event { create(:event) }
    recipient nil
    email 'recipient@example.com'
    token nil
  end
end