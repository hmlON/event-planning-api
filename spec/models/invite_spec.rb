RSpec.describe Invite, type: :model do
  it 'has a valid factory' do
    expect(build(:invite)).to be_valid
  end

  it 'has token after creation' do
    invite = create(:invite, token: nil)
    expect(invite.token.length).to eq 40
  end

  it 'assigns recipient when valid email provided' do
    recipient = create(:user, email: 'recipientmail@example.com')
    invite = create(:invite, email: 'recipientmail@example.com')
    expect(invite.recipient).to eq recipient
  end
end
