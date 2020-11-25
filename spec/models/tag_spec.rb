require 'rails_helper'

RSpec.describe Tag, :type => :model do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:posts) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:guideline) }
    it { is_expected.to validate_presence_of(:about) }
    # it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end
end
