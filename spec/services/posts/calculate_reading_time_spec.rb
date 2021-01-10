require 'rails_helper'

RSpec.describe Posts::CalculateReadingTime do
  let(:post) { build(:post) }

  context 'when valid attributes' do
    it 'equel 1 if conte shorter then words per minute value' do
      content = 'This is my title'

      reading_time = described_class.call(content)

      expect(reading_time).to eq(1)
    end

    it 'equel 1 if conte has 300 words' do
      content = Faker::Lorem.sentence(word_count: 300)
      reading_time = described_class.call(content)

      expect(reading_time).to eq(1)
    end

    it 'equel 13 if cont has 3000 words' do
      # 3000 / 230
      content = Faker::Lorem.sentence(word_count: 3000)
      reading_time = described_class.call(content)

      expect(reading_time).to eq(13)
    end
  end
end
