class Club < ApplicationRecord
  has_rich_text :info

  has_many :users
  has_many :application_submissions

  validates :name, presence: true, uniqueness: true
end
