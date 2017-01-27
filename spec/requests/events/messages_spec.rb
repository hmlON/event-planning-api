describe 'Messages', type: :request do
  describe 'GET /event/id/messages' do
    let(:user) { create(:user) }
    let(:event) { create(:event) }
    before(:each) do
      create_list(:message, 5, event: event, user: user)
      another_user = create(:user)
      event.users << another_user
      create_list(:message, 5, event: event, user: another_user)
    end

    it 'returns messages for event with given id' do
      get_as_user "/events/#{event.id}/messages"
      expect(response).to have_http_status(200)
      expect(json.length).to eq 10
    end
  end
end
