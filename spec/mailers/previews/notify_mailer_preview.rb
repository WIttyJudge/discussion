# Preview all emails at http://localhost:3000/rails/mailers/notify_mailer
class NotifyMailerPreview < ActionMailer::Preview
  def confirm_destroy_acccount
    NotifyMailer.with(user: User.first).confirm_destroy_account
  end
end
