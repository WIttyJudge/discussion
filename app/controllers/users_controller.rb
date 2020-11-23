class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit]
  before_action :set_settings_tab, only: %i[edit]
  before_action :set_current_user, only: %i[
    edit request_destroy confirm_destroy
  ]
  before_action :set_user, only: %i[update]

  # GET /settings/:tab
  def edit; end

  # PATCH /users/:id
  def update
    return unless @user

    if @user.update(user_update_params)
      text = 'Your profile was successfully updated.'
      flash[:notice] = text
      redirect_to user_settings_path('profile')
    end
  end

  def request_destroy
    if user_destroy_token_exists?
      text = "You have already requested deletion. Please, check your email for further instructions."
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

  # GET /confirm_signout
  def  confirm_signout; end

  private

  def set_settings_tab
    @tab = params[:tab] || 'profile'
  end

  def set_current_user
    @user = current_user
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_update_params
    params.require(:user).permit(:email, :username, :summery)
  end

  def user_destroy_token_exists?
    Rails.cache.exist?("user-destroy-token:#{current_user.id}")
  end

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end
end
