module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_admin

    private

    def verify_admin
      redirect_to root_path unless current_user.has_role?(:almighty)
    end
  end
end