feature 'User' do
  scenario 'can sign in' do
    visit new_user_registration_path
    expect{
      fill_in 'Name', with: 'Your Name'
      fill_in 'Email', with: 'newuser@example.com'
      fill_in 'Password', with: 'secret123'
      fill_in 'Password confirmation', with: 'secret123'
      click_button 'Sign up'
    }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
