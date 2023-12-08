class DbAbility
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can(:manage, :all) if user.admin?

    user.permissions.each do |permission|
      permission.actions_arr.each do |action| 
        can action, permission.subject.constantize
        p [action, permission.subject]
      end
    end

    # if user.has_role?(:club_member)
    #   can :read, Application
    # end
  end
end
