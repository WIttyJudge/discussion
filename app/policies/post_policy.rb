class PostPolicy < ApplicationPolicy
  def destroy?
    user.id == record.author_id or user.has_role? :almighty
  end
end