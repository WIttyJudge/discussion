require 'rails_helper'

describe ApplicationPolicy do
  subject { described_class.new(user, record) }
  
  let(:record) { create(:post) }

  describe "REST methods" do
    let(:user) { create(:user) }

    it { should forbid_actions(%i[index show new create edit update destroy]) }
  end
end