require 'rails_helper'

describe UserPolicy do
  subject { described_class.new(user, record) }

  describe "authorized user" do
    let(:user) { create(:user) }
    let(:record) { create(:user) }

    # it { is_expected.to permit_action(%i[edit update request_destroy destroy]) }
  end

  describe "not authorized user" do
    let(:user) { nil }
    let(:record) { nil }

    it { is_expected.to forbid_actions(%i[edit update request_destroy destroy]) }
  end
end
