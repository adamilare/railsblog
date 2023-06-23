class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    p 'abilit ---', user
    return unless user.present?

    can :read, :all
    can :manage, Post, author_id: user.id
    can :delete, Post, author_id: user.id # if user.admin?
  end
end
