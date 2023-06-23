class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can :read, :all
    can :manage, Post, author_id: user.id
    can :delete, Post, author_id: user.id

    return unless user.admin?

    can :manage, :all
  end
end
