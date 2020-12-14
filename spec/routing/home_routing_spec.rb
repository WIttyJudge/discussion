require 'rails_helper'

RSpec.describe 'routes for Home', :type => :routing do
  it { is_expected.to route(:get, root_path).to(controller: :home, action: :index) }
end
