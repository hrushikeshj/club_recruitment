class Club < ApplicationRecord
  has_rich_text :info

  has_many :users

  validates :name, presence: true, uniqueness: true
end
