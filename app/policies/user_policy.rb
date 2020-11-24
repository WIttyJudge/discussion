class UserPolicy < ApplicationPolicy
  def update?
    current_user?
  end

  def request_destroy?
    current_user?
  end

  def confirm_destroy?
    current_user?
  end

  def destroy?
    current_user?
  end

  def confirm_signout?; end

  private

  def current_user?
    user == record if user
  end
end