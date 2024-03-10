# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.admin?
      can :manage, :all
      can :read, Motor::Admin
    else
      can :read, Entry
      can :create, Entry if user.persisted?
      can :update, Entry, user_id: user.id
      can :destroy, Entry, user_id: user.id
    end
  end
end
