class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit]
  before_action :set_settings_tab, only: %i[edit]
  before_action :set_user, only: %i[
    request_destroy confirm_destroy
  ]

  # GET /settings/:tab
  def edit; end

  # GET /confirm_signout
  def  confirm_signout; end

  def request_destroy
    if user_destroy_token_exists?
      text = "You have already requested deletion. Please, check your email for further instructions"
      flash[:notice] = text
      redirect_to user_settings_path('account')
      return
    end

    Users::RequestDestroy.call(@user)
    text = "A request to delete your account has been created. Please, check your email for further instructions."
    flash[:notice] = text
    redirect_to user_settings_path('account')
  end

  def confirm_destroy
    destroy_token = Rails.cache.read("user-destroy-token:#{@user.id}")
    not_found unless destroy_token && destroy_token == params[:token]
  end

  def destroy
    sign_out @user
  end

  private

  def set_settings_tab
    @tab = params[:tab] || 'profile'
  end

  def set_user
    @user = current_user
  end

  def user_destroy_token_exists?
    Rails.cache.exist?("user-destroy-token:#{current_user.id}")
  end

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end
end
