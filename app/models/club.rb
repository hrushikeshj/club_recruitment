class Club < ApplicationRecord
  has_rich_text :info
  has_one_attached :cover_pic

  has_many :users
  has_many :application_submissions

  validates :name, presence: true, uniqueness: true

  ## selected applications - top of the preference list
  def selected_applications
    submissions = self.application_submissions.selected.includes(:user)

    submissions.select do |sub|
      user_application_submissions = sub.user.application_submissions.selected.order(preference_no: :asc)
      
      # check if the sub is in the top
      user_application_submissions.first.id == sub.id
    end
  end
end
