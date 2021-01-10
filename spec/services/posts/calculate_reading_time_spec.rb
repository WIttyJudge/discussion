require 'rails_helper'

RSpec.describe Posts::CalculateReadingTime, type: :model do
  let(:post) { build(:post) }

  context 'when valid attributes' do
    it 'equel 1 if body shorter then words per minute value' do
      post.body = 'This is my title'
      post.save

      expect(post.reading_time).to eq(1)
    end

    it 'equel 1 if body has 300 words' do
      post.body = Faker::Lorem.sentence(word_count: 300)
      post.save

      expect(post.reading_time).to eq(1)
    end

    it 'equel 10 if body has 3000 words' do
      # 3000 / 230
      post.body = Faker::Lorem.sentence(word_count: 3000)
      post.save

      expect(post.reading_time).to eq(13)
    end
  end
end
