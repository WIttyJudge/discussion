class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :destroy, Post if user.has_cached_role?(:moderator, Post)

    can [:destroy, :update], Post, :author_id => user.id

    # Almighty can do anything
    if user.has_cached_role? :almighty
      can :manage, :all
    end
  end
end
