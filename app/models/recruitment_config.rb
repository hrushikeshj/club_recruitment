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

  def self.locked?
    rc = RecruitmentConfig.find_or_create_by(key: 'lock')
    
    rc.update(congif: '1') if rc.congif.nil?

    return rc.congif == '1'
  end

  def self.update_lock(lock_status)
    RecruitmentConfig.find_or_create_by(key: 'lock').update(congif: (lock_status ? '1' : '0'))
  end
end
