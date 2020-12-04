class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params_array = %i[name email username password password_confirmation]
    params.require(:user).permit(params_array)
  end
end
