class Application < ApplicationRecord
  has_rich_text :projects
  has_rich_text :skills

  belongs_to :user

  validates :projects, presence: true
  validates :skills, presence: true
  validates :github_link, presence: true
end
