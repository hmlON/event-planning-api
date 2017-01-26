FactoryGirl.define do
  factory :invite do
    sender { create(:user) }
    event { create(:event) }
    email 'recipient@example.com'
    recipient nil
    token nil

    # after(:build) do
    #   create(:user, email: 'recipient@example.com')
    # end
  end
end
