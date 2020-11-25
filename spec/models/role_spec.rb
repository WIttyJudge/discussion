require 'rails_helper'

RSpec.describe Role, :type => :model do
  describe 'associations' do
    it do
      expect(subject).to have_and_belong_to_many(:users)
        .join_table(:users_roles)
    end
  end

  describe 'validations' do
    it do
      validate_inclusion_of(:resource_type)
        .in_array([Rolify.resource_types])
        .allow_nil
    end

    it do
      validate_inclusion_of(:name)
        .in_array([Role::ROLES])
    end
  end
end
