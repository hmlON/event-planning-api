describe 'Events API', type: :request do
  describe 'DELETE /events/:id' do
    let(:event) { create(:event) }

    context 'when user is signed in' do
      let(:user) { create(:user) }

      let(:valid_attributes) { attributes_for(:event) }

      it 'destroys the event' do
        delete_as_user("/events/#{event.id}")

        expect(response).to have_http_status(:no_content)
        expect(response.body).to be_empty
      end
    end

    context 'when user is not signed in' do
      it 'returns :unauthorized response code' do
        delete "/events/#{event.id}"
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to be_empty
      end
    end
  end
end
