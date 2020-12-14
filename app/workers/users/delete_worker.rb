module Users
  class DeleteWorker
    include Sidekiq::Worker
    sidekiq_options retry: 5

    def perform(user_id)
      user = User.find(user_id)

      return unless user

      user.destroy
    end
  end
end
