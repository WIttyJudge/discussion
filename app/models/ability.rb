class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Almighty can do anything
    if user.has_cached_role? :almighty
      can :manage, :all
    else
      can :destroy, Post if user.has_cached_role?(:moderator, Post)

      can [:destroy, :update], Post, :user_id => user.id
    end
  end
end
