module Users
  class RequestDestroy < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      # Создать уникальный ключ expired 24 часа.

      # Отправить сообщение по почте о подтвеждении удаления.
    end

    private

    attr_reader :user
  end
end