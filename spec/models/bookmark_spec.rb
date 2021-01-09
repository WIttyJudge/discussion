require 'rails_helper'

RSpec.describe Bookmark, :type => :model do
  describe 'associations' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
  end
end
