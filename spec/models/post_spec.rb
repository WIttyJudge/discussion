require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe "associations" do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:replies).dependent(:destroy) }
    it { should have_and_belong_to_many(:tags) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title)
        .is_at_least(10)
        .is_at_most(128)
    }
    it { should validate_presence_of(:body) }
  end

end