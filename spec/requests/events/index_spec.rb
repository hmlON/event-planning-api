describe 'Events API', type: :request do
  describe 'GET /events' do
    context 'when user is signed in' do
      let(:user) { create(:user) }
      it 'returns all events' do
        create_list(:event, 10)
        get_as_user('/events')

        expect(response).to have_http_status(:ok)
        expect(json.length).to eq 10
      end

      context 'when due time is present' do
        it 'returns events that will start before due time' do
          create_list(:event, 5, time: Time.current + 1.day)
          create_list(:event, 5, time: Time.current + 3.days)

          get_as_user('/events', due: Time.current + 2.days)

          expect(response).to have_http_status(:ok)
          expect(json.length).to eq 5
        end
      end

      context 'when due time is present' do
        it 'returns events that will start before due time' do
          create_list(:event, 5, time: Time.current + 1.day)
          create_list(:event, 5, time: Time.current + 3.days)

          get_as_user('/events', interval: '2d')

          expect(response).to have_http_status(:ok)
          expect(json.length).to eq 5
        end
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
