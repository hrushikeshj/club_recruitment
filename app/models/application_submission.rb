class ApplicationSubmission < ApplicationRecord
  belongs_to :application
  belongs_to :club
  before_save :set_preference, if: :new_record?

  validates :club_id, presence: true
  validates :preference_no, uniqueness: { scope: :club_id }

  # application can submitted only once to one club
  validates :club_id, uniqueness: { scope: :application_id }


  private

  # default preference_no
  def set_preference
    self.preference_no = ApplicationSubmission.where(application_id: self.application_id).count + 1
  end
end
