class Branch < ApplicationRecord
  has_many :users

  validates :name, uniqueness: true
  validates :code, uniqueness: true
end
