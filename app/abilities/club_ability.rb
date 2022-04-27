class ClubAbility
  include CanCan::Ability

  def initialize(user)
    can :read, Club # TODO: split

    return unless user.present?

    can :update, Club, id: user.club_id

    can :council_dashboard, Club if user.has_role?(:council)

    return unless user.admin?

    can :manage, Club
  end
end
