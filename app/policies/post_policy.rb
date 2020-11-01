class PostPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def update?
    user_is_author? || user_is_admin?
  end

  def destroy?
    user_is_author? || user_is_admin?
  end

  private

  def user_is_author?
    record.author_id == user&.id
  end

  def user_is_admin?
    user&.has_cached_role? :almighty
  end
end