describe 'Authentication', reqrest_section: 'Login and Sign up' do
  describe 'POST /oauth/token' do
    describe 'grant_type password' do
      context 'with valid params' do
        let(:user) { create :user, email: 'user@example.com', password: '12345678', password_confirmation: '12345678' }

        context 'without client credentials' do
          it 'returns token', reqrest_title: 'Get access token without client credentials' do
            post '/oauth/token',
                 'grant_type' => 'password',
                 'email' => user.email,
                 'password' => '12345678'

            expect(Doorkeeper::AccessToken.count).to eq 1
            expect(Doorkeeper::AccessToken.first.application_id).to eq nil

            expect(json['access_token'].size).to eq 64
            expect(json['refresh_token'].size).to eq 64
            expect(json['token_type']).to eq 'bearer'
            expect(json['expires_in']).to eq 7200
            expect(json['created_at']).to be_present
            expect(response.status).to eq 200
          end
        end
      end

      context 'when credentials are not valid', :skip_reqres do
        it 'returns error' do
          post '/oauth/token',
            'grant_type' => 'password',
            'username' => 'invalid@example.com',
            'password' => 'invalid'

          expect(json).to eq(
            'error' => 'invalid_grant',
            'error_description' => 'The provided authorization grant is invalid, expired, revoked, does not match ' \
              'the redirection URI used in the authorization request, or was issued to another client.')
          expect(response.status).to eq 401
        end
      end
    end
  end
end
