class TagPolicy < ApplicationPolicy
  def create?
    user_almighty?
  end

  def destroy
    user_almighty?
  end

  private

  def user_almighty?
    user&.has_cached_role? :almighty
  end
end
