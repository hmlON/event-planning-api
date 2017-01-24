describe 'Events API', type: :request do
  describe 'POST /events' do
    context 'when user is signed in' do
      let(:user) { create(:user) }

      context 'with valid attributes' do
        let(:valid_attributes) { attributes_for(:event) }

        it 'returns the event' do
          post_as_user('/events', event: valid_attributes)

          expect(response).to have_http_status(:created)
          expect(json['description']).to eq valid_attributes[:description]
        end
      end

      context 'with invalid attributes' do
        let(:invalid_attributes) { attributes_for(:event, place: nil) }

        it 'returns the event' do
          post_as_user('/events', event: invalid_attributes)

          expect(response).to have_http_status(:unprocessable_entity)
          expect(json['place']).to be_a(Array)
        end
      end
    end

    context 'when user is not signed in' do
      it 'returns :unauthorized response code' do
        post '/events', params: attributes_for(:event, user_id: nil)
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to be_empty
      end
    end
  end
end
