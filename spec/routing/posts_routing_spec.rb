require 'rails_helper'

RSpec.describe 'routes to Posts', :type => :routing do
  it 'though 404 error_controller' do
    is_expected.to route(:get, '/posts')
      .to(controller: :errors, action: :page_not_found, unmatched: 'posts')
  end

  it do
    is_expected.to route(:get, post_path('this-is-slug'))
      .to(controller: :posts, action: :show, slug: 'this-is-slug')
  end
end
