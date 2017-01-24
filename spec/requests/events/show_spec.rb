describe 'Events API', type: :request do
  describe 'GET /events/:id' do
    let(:event) { create(:event) }

    context 'when user is signed in' do
      let(:user) { create(:user) }
      it 'returns the event' do
        get_as_user("/events/#{event.id}")

        expect(response).to have_http_status(:ok)
        expect(json['description']).to eq event.description
      end
    end

    context 'when user is not signed in' do
      it 'returns :unauthorized response code' do
        get '/events', params: { id: event.id }
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to be_empty
      end
    end
  end
end
