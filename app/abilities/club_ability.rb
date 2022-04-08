class RoleAbility
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Role # TODO: split
    can :update, Role, id: user.club_id

    return unless user.admin?

    can :manage, Role
  end
end
