# Preview all emails at http://localhost:3000/rails/mailers/notify_mailer
class NotifyMailerPreview < ActionMailer::Preview
  def confirm_destroy_acccount
    token = SecureRandom.hex(10)
    NotifyMailer.with(user: User.first, destroy_token: token).confirm_destroy_account
  end
end
