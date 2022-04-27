class ApplicationSubmissionAbility
    include CanCan::Ability
  
    def initialize(user)  
      return unless user.present?
      can :read, ApplicationSubmission
      can :create, ApplicationSubmission
      can :update, ApplicationSubmission
  
      return unless user.admin?
      can :manage, ApplicationSubmission
    end
  end
