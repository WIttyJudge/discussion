require 'rails_helper'

RSpec.describe Tag, :type => :model do
  describe "associations" do
    it { should have_and_belong_to_many(:posts) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    # it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }

  end
end
