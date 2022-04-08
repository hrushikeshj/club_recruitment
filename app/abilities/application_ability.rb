class ApplicationAbility
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Application, user_id: user.id
    can :create, Application
    can :update, Application, user_id: user.id
    can :destroy, Application, user_id: user.id

    if user.has_role?(:club_member)
      can :read, Application
    end

    return unless user.admin?
    can :manage, :all
  end
end
