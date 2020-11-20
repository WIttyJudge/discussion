require "rails_helper"

RSpec.describe Post, :type => :model do
  let(:post) { create(:post) }

  describe "associations" do
    it { should belong_to(:author).class_name("User") }
    it { should have_many(:replies).dependent(:destroy) }
    it { should have_and_belong_to_many(:tags) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title)
      .is_at_least(10)
      .is_at_most(60)
    }
    it { should validate_presence_of(:body) }
  end

  describe "#capitalize_first_char_title" do
    let!(:post) { create(:post, title: "this is My striNg") }

    it "first character is uppercase" do
      expect(post.title[0]).to eq("T")
    end

    it "full title formatted correctly" do
      expect(post.title).to eq("This is My striNg")
    end
  end

  describe "#create_slug" do
    let(:post) { build(:post) }

    it "slug is not created" do
      expect(post.slug.blank?).to be_truthy
    end

    it "slug will be defined before_save" do
      post.save
      expect(post.slug.blank?).to be_falsey
    end
  end

  describe ".recent" do
    let!(:post1) { create(:post) }
    let!(:post2) { create(:post) }

    it "return posts ordered by created_at" do
      expect(Post.recent.pluck(:created_at)).to eq([post2.created_at, post1.created_at])
    end

    it "incorrect posts return by created_at" do
      expect(Post.recent.pluck(:created_at)).not_to eq([post1.created_at, post2.created_at])
    end
  end
end