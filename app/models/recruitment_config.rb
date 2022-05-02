class RecruitmentConfig < ApplicationRecord
  def self.get_deadline
    rc = RecruitmentConfig.find_or_create_by(key: 'deadline')
    
    rc.update(date: Time.now) if rc.date.nil?

    return rc
  end

  def self.update_deadline(date)
    RecruitmentConfig.find_or_create_by(key: 'deadline').update(date: date)
  end

  def self.application_open?
    Time.now <= RecruitmentConfig.get_deadline.date
  end
end
