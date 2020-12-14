class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit]
  before_action :set_settings_tab, only: %i[edit]
  before_action :set_current_user, only: %i[
    edit update request_destroy confirm_destroy destroy
  ]
  before_action :set_user, only: %i[show]

  # Pages in settings panel.
  # This is used in app/views/users/edit.html.erb
  SETTINGS_MENU_ITEMS = [
    { name: 'profile' },
    { name: 'account' }
  ].freeze

  def show; end

  # GET /settings/:tab
  def edit; end

  # PUT/PATCH /users/:username
  def update
    @user.update(user_update_params)

    if @user.save
      flash[:notice] = 'Your profile was successfully updated.'
    else
      flash[:alert] = @user.errors.full_messages.first
    end

    redirect_to user_settings_path('profile')
  end

  def request_destroy
    if user_destroy_token_exists?
      text = 'You have already requested deletion. Please, check your email for further instructions.'
    else
      Users::RequestDestroy.call(@user)
      text = 'A request to delete your account has been created. Please, check your email for further instructions.'
    end

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
    @tab = params[:tab]
  end

  def set_current_user
    @user = current_user
    authorize @user, policy_class: UserPolicy
  end

  def set_user
    @user = User.find_by(username: params[:username])
  end

  def user_update_params
    params_array = %i[name email username summery location]
    params.require(:user).permit(params_array)
  end

  def user_destroy_token_exists?
    Rails.cache.exist?("user-destroy-token:#{current_user.id}")
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
