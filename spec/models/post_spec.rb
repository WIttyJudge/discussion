require 'rails_helper'

RSpec.describe Post, :type => :model do
  let(:post) { create(:post) }

  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User') }
    it { is_expected.to have_many(:replies).dependent(:destroy) }
    it { is_expected.to have_and_belong_to_many(:tags) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }

    it do
      expect(subject).to validate_length_of(:title)
        .is_at_least(10)
        .is_at_most(100)
    end

    it { is_expected.to validate_presence_of(:body) }
  end

  describe 'delegates' do
    it { is_expected.to delegate_method(:name).to(:author).with_prefix }
    it { is_expected.to delegate_method(:username).to(:author).with_prefix }
  end

  describe '.recent' do
    let!(:post1) { create(:post) }
    let!(:post2) { create(:post) }

    it 'return posts ordered by created_at' do
      expect(described_class.recent.pluck(:created_at)).to eq([post2.created_at, post1.created_at])
    end

    it 'incorrect posts return by created_at' do
      expect(described_class.recent.pluck(:created_at)).not_to eq([post1.created_at, post2.created_at])
    end
  end

  describe '#capitalize_first_char_title' do
    let!(:post) { create(:post, title: 'this is My striNg') }

    it 'first character is uppercase' do
      expect(post.title[0]).to eq('T')
    end

    it 'full title formatted correctly' do
      expect(post.title).to eq('This is My striNg')
    end
  end

  describe '#create_slug' do
    let(:post) { build(:post) }

    it 'slug is not created' do
      expect(post.slug).to be_blank
    end

    it 'slug will be defined before_save' do
      post.save
      expect(post.slug).not_to be_blank
    end
  end

  describe '#calculate_reading_time' do
    let(:post) { build(:post) }

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

    it 'equel 13 if body has 3000 words' do
      # 3000 / 230
      post.body = Faker::Lorem.sentence(word_count: 3000)
      post.save

      expect(post.reading_time).to eq(13)
    end
  end
end
