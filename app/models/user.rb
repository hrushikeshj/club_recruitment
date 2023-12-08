class User < ApplicationRecord
  has_secure_password

  has_many :role_assignment, inverse_of: :user, dependent: :destroy # should be role_assignments
  has_many :roles, through: :role_assignment
  belongs_to :club, optional: true
  has_one :application, dependent: :destroy
  belongs_to :branch, optional: true

  has_many :application_submissions, through: :application
  has_many :permissions, through: :roles

  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  accepts_nested_attributes_for :role_assignment

  after_save :assign_default_role

  validates :email, presence: true, uniqueness: true

  def final_selected_club
    return nil if application_submissions.selected.empty?

    application_submissions.selected.order(preference_no: :asc).first.club
  end

  def display_role
    if applicant?
      'Applicant'
    elsif council?
      'Council'
    elsif admin?
      'Admin'
    elsif convener?
      'Convener'
    else
      roles&.first&.name
    end
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def council?
    has_role?(:council)
  end

  def applicant?
    has_role?(:applicant)
  end

  def admin?
    has_role?(:admin)
  end

  def convener?
    has_role?(:convener)
  end

  def assign_role(role_id)
    role_assignment.create(role_id: role_id)
  end

  private

  def assign_default_role
    return if roles.present?

    self.assign_role(Role.find_by(name: 'applicant').id)
  end

end
