class UserAbility
  include CanCan::Ability

  def initialize(user)
    can :create, User
    return unless user.present?

    can :info, User
    can :read, User # TODO: split
    can :update, User, id: user.id

    can :applicant_dashboard, User, id: user.id

    return unless user.admin?

    can :admin, User
    can :manage, User
  end
end