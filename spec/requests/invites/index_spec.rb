describe 'Invites', type: :request do
  describe 'GET /invites' do
    let(:user) { create(:user) }
    it 'works! (now write some real specs)' do
      get_as_user invites_path
      expect(response).to have_http_status(200)
    end
  end
end
