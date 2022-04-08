class UserAbility
  include CanCan::Ability

  def initialize(user)
    can :create, User
    return unless user.present?

    can :read, User # TODO: split
    can :update, User, id: user.id

    return unless user.admin?

    can :admin, User
    can :manage, User
  end
end