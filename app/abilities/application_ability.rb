class ApplicationAbility
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Application
    can :create, Application
    can :update, Application, user_id: user.id
    can :destroy, Application, user_id: user.id

    return unless user.admin?
    can :manage, :all
  end
end
