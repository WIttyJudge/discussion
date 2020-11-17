require 'rails_helper'

describe PostPolicy do
  subject { described_class.new(user, post) }

  let(:post) { create(:post) }

  describe "visitor" do
    let(:user) { nil }

    it { should forbid_actions(%i[new create edit update destroy]) }
  end

  describe "signed in user" do
    let(:user) { create(:user) }

    it { should permit_actions(%i[new create]) }
  end

  describe ".user_author?" do
    let(:user) { create(:user) }
    let(:post) { create(:post, author: user) }

    it { should permit_actions(%i[new create edit update destroy delete_confirm]) }
  end

  describe ".user_almighty?" do
    let(:user) { create(:user, :with_role) }

    it { should permit_actions(%i[new create edit update destroy delete_confirm]) }
  end
end