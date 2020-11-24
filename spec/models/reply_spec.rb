require 'rails_helper'

RSpec.describe Reply, :type => :model do
  describe "assoisiations" do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validates" do
    it { is_expected.to validate_presence_of(:reply) }
  end
end
