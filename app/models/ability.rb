# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    return unless user.present?
    can :read, :all
    can :read, Post

    return unless user.present?
    can :read, Post, User
    can :manage, Post, user: user
    can :manage, Comment, user: user

    return unless user.admin?

    can :manage, Post
    can :manage, Comment
   
  end
end
