class NotifyMailer < ApplicationMailer
  def confirm_destroy_account
    @user = params[:user]
    @destroy_token = params[:destroy_token]
    subject = 'Discussion - Confirm Account Deletion'

    mail(to: @user.email, subject: subject)
  end

  def account_deleted; end
end
