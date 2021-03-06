# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       can :read, :all
       can :manage, [Post, Comment], user_id: user.id
       if user.admin?
        can :destroy, [Post, Comment]
       end
  end
end
