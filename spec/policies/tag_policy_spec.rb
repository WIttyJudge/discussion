require 'rails_helper'

describe TagPolicy do
  subject { described_class.new(user, tag) }

  let(:tag) { create(:tag) }

  describe 'user is admin' do
    let(:user) { create(:user, :with_role) }

    it { is_expected.to permit_actions(%i[new create]) }
  end
end
