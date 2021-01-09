require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'associations' do
    it { is_expected.to have_many(:posts).with_foreign_key('author_id') }
    it { is_expected.to have_many(:replies) }
    it { is_expected.to have_many(:bookmarks) }

    it {
      expect(subject).to have_many(:bookmarked_posts)
        .through(:bookmarks)
        .source(:post)
        .dependent(:destroy)
    }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to allow_value('thisismyusername').for(:username) }
    it { is_expected.not_to allow_value('this is my username').for(:username) }
    it { is_expected.to validate_length_of(:summery).is_at_most(200) }
  end
end
