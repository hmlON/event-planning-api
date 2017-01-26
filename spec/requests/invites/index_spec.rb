describe 'Invites', type: :request do
  describe 'GET /invites' do
    let(:user) { create(:user) }
    before(:each) do
      recipient = create(:user)
      create_list(:invite, 2, sender: user, email: recipient.email)
      create_list(:invite, 2, sender: recipient, email: user.email)
      another_recipient = create(:user)
      create_list(:invite, 10, email: another_recipient.email)
    end

    it 'return only invites owned by user' do
      get_as_user invites_path
      expect(response).to have_http_status(200)
      expect(json.length).to eq 4
    end
  end
end
