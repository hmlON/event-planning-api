describe 'Events API', type: :request do
  describe 'GET /events' do
    before(:each) do
      create_list(:event, 10)
    end

    context 'when user is signed in' do
      let(:user) { create(:user) }
      it 'returns all events' do
        get_as_user('/events')

        expect(response).to have_http_status(:ok)
        expect(json.length).to eq 10
      end
    end

    context 'when user is not signed in' do
      it 'returns :unauthorized response code' do
        get '/events'
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to be_empty
      end
    end
  end
end
