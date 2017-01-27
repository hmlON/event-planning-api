RSpec.describe Message, type: :model do
  it 'has a valid factory' do
    expect(build(:message)).to be_valid
  end

  it 'is invalid without text' do
    expect(build(:message, text: nil)).not_to be_valid
  end
end
