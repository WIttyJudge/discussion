require 'rails_helper'

RSpec.describe Reply, :type => :model do
  describe "assoisiations" do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end
end