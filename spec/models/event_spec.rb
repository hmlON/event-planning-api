RSpec.describe Event, type: :model do
  context 'validation' do
    it 'has a valid factory' do
      expect(build(:event)).to be_valid
    end

    it 'is invalid with time in the past' do
      expect(build(:event, time: Time.current + 1.second)).to be_valid
      expect(build(:event, time: Time.current - 1.second)).not_to be_valid
    end

    it 'is invalid with place length more then 50' do
      expect(build(:event, place: 'a' * 51)).not_to be_valid
    end
  end

  context 'scope' do
    describe '#due' do
      it 'returns events that will start before due time' do
        first_event = create(:event, time: Time.current + 1.days)
        second_event = create(:event, time: Time.current + 3.days)
        expect(Event.due(Time.current + 2.days)).to eq [first_event]
      end
    end
  end
end
