module Users
  class RequestDestroy < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      destroy_token = SecureRandom.hex(10)

      Rails.cache.write("user-destroy-token:#{user.id}", destroy_token, expires_in: 12.hours.to_i)

      NotifyMailer.with(user: user, destroy_token: destroy_token).confirm_destroy_account.deliver_now
    end

    private

    attr_reader :user
  end
end
