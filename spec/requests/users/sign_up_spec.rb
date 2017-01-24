describe 'Signup' do
  describe 'POST /users' do
    context 'with valid params' do
      it 'creates User' do
        post '/users',
             params: { user: attributes_for(:user, email: 'user@example.com'),
                       format: :json }

        user = User.first
        expect(user.email).to eq 'user@example.com'

        expect(response.body).to eq user.to_json
        expect(response.status).to eq 201
      end
    end

    context 'with invalid params' do
      it 'does not create User' do
        post '/users',
             params: { format: :json,
                       email: 'invalid',
                       password: '' }

        expect(User.count).to eq 0

        expect(json).to eq('errors' => { 'email' => ["can't be blank"], 'password' => ["can't be blank"], "name"=>["can't be blank"] })
        expect(response.status).to eq 422
      end
    end
  end
end
