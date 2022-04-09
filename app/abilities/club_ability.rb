class ClubAbility
  include CanCan::Ability

  def initialize(user)
    can :read, Club # TODO: split

    return unless user.present?

    can :update, Club, id: user.club_id

    return unless user.admin?

    can :manage, Club
  end
end
