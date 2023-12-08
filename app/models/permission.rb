class Permission < ApplicationRecord
  validate :subject_is_valid
  validate :actions_are_valis
  validates :actions, presence: true

  has_many :role_permissions, dependent: :destroy
  has_many :roles, through: :role_permissions

  accepts_nested_attributes_for :role_permissions

  def actions_arr
    actions.split(",").map(&:to_sym)
  rescue
    p "Errorr---________________________________________________----"
    []
  end

  def subject_is_valid
    begin
      subject.constantize
    rescue => e
      errors.add(:subject, "Enter a valid subject. #{e.message}")
    end
  end

  def actions_are_valis
    begin
      actions.split(",").map(&:to_sym)
    rescue => e
      
    end
  end
end
