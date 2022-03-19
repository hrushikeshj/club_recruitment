class RoleAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates :user_id, presence: true, uniqueness: { scope: :role_id }
  validates :role_id, presence: true
end
