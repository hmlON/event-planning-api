RSpec.describe Event, type: :model do
  it 'has a valid factory' do
    expect(build(:event)).to be_valid
  end

  it 'is invalid without user' do
    expect(build(:event, user: nil)).not_to be_valid
  end

  it 'is invalid with time in the past' do
    expect(build(:event, time: Time.current + 1.second)).to be_valid
    expect(build(:event, time: Time.current - 1.second)).not_to be_valid
  end

  it 'is invalid with place length more then 50' do
    expect(build(:event, place: "a"*51)).not_to be_valid
  end
end
