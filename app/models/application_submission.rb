class ApplicationSubmission < ApplicationRecord
  belongs_to :application
  belongs_to :club
  has_one :user, through: :application

  before_save :set_preference, if: :new_record?

  validates :club_id, presence: true
  validates :preference_no, uniqueness: { scope: :club_id }

  # application can submitted only once to one club
  validates :club_id, uniqueness: { scope: :application_id }

  enum status: {
    "pending": 0,
    "call_for_interview": 1,
    "short_list": 2,
    "selected": 3
  }

  scope :selected, -> { where(selected: true) }

  def self.update_preference(sub, new_pref_no)
    submissions = ApplicationSubmission.where(application_id: sub.application_id)
    if new_pref_no < sub.preference_no
      ActiveRecord::Base.transaction do
        submissions.where(preference_no: new_pref_no...sub.preference_no).update_all("preference_no = preference_no+1")
        sub.update_attribute('preference_no', new_pref_no)
      end
    elsif new_pref_no > sub.preference_no
      ActiveRecord::Base.transaction do
        submissions.where(preference_no: (sub.preference_no+1)..new_pref_no).update_all("preference_no = preference_no-1")
        sub.update_attribute('preference_no', new_pref_no)
      end
    end
  end

  def humanize_status
    status&.humanize
  end
  private

  # default preference_no
  def set_preference
    self.preference_no = ApplicationSubmission.where(application_id: self.application_id).count + 1
  end
end
