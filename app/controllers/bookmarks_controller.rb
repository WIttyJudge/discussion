class BookmarksController < ApplicationController
  before_action :set_user, only: %i[create]

  def create; end

  private

  def set_user
    @user = current_user
  end
end
