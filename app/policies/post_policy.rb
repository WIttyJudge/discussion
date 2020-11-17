class PostPolicy < ApplicationPolicy
  def create?
    user
  end

  def update?
    user_author? || user_almighty?
  end

  def destroy?
    user_author? || user_almighty?
  end

  def delete_confirm?
    destroy?
  end

  private

  def user_author?
    record.author_id == user&.id
  end

  def user_almighty?
    user&.has_cached_role? :almighty
  end
end