class UsersController < ApplicationController
  before_action :set_settings_tab, only: %i[edit]
  before_action :set_user, only: %i[
    request_destroy
  ]

  # GET /settings/:tab
  def edit; end

  # GET /signout_confirm
  def signout_confirm; end

  def request_destroy
    Users::RequestDestroy.call(@user)
    text = "A request to delete your account has been created. Please, check your email for further instructions."
    flash[:notice] = text
    redirect_to user_settings_path('account')
  end


  private

  def set_settings_tab
    @tab = params[:tab] || 'profile'
  end

  def set_user
    @user = current_user
  end

end
