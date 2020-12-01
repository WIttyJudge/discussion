module Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :verify_access

    # This is used in app/views/layouts/admin.html.erb
    MENU_ITEMS = [
      { name: 'posts', controller:  'posts'},
      { name: 'replies', controller: 'replies' },
      { name: 'tags', controller: 'tags' }
    ].sort_by { |menu_item| menu_item[:name] }.freeze

    private

    def verify_access
      redirect_to root_path unless current_user.has_role? :almighty
    end
  end
end
