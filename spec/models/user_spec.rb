require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'associations' do
    it { is_expected.to have_many(:posts).with_foreign_key('author_id') }
    it { is_expected.to have_many(:replies) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
  end
end
