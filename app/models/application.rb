class Application < ApplicationRecord
  has_rich_text :projects
  has_rich_text :skills

  belongs_to :user
  has_many :application_submissions

  validates :projects, presence: true
  validates :skills, presence: true
  validates :github_link, presence: true


  def display_name
    # for active admin
    "ID #{user.id}: #{user.name}'s application"
  end
end
