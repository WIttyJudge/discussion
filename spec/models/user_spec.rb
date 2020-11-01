require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "associations" do
    it { should have_many(:posts).with_foreign_key('author_id') }
    it { should have_many(:replies) }
  end

  describe "validations" do
    it { should validate_presence_of(:username) }
  end
end
