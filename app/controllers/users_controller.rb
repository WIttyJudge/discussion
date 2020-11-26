class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit]
  before_action :set_settings_tab, only: %i[edit]
  before_action :set_current_user, only: %i[
    edit update request_destroy confirm_destroy destroy
  ]

  # Pages in settings panel.
  # This is used in app/views/users/edit.html.erb
  SETTINGS_MENU_ITEMS = [
    { name: 'profile' },
    { name: 'account' }
  ].freeze

  # GET /settings/:tab
  def edit; end

  # PUT/PATCH /users/:id
  def update
    @user.update(user_update_params)

    unless @user.save
      error = @user.errors.full_messages.first
      flash[:alert] = error
      redirect_to user_settings_path
      return
    end

    text = 'Your profile was successfully updated.'
    flash[:notice] = text
    redirect_to user_settings_path
  end

  def request_destroy
    if user_destroy_token_exists?
      text = 'You have already requested deletion. Please, check your email for further instructions.'
      flash[:notice] = text
      redirect_to user_settings_path('account')
      return
    end

    Users::RequestDestroy.call(@user)
    text = 'A request to delete your account has been created. Please, check your email for further instructions.'
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
  def confirm_signout; end

  private

  def set_settings_tab
    @tab = params[:tab] || 'profile'
  end

  def set_current_user
    @user = current_user
    authorize @user, policy_class: UserPolicy
  end

  def user_update_params
    params.require(:user).permit(:email, :username, :summery, :location)
  end

  def user_destroy_token_exists?
    Rails.cache.exist?("user-destroy-token:#{current_user.id}")
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
