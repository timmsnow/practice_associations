class Meeting < ApplicationRecord
  has_many :meeting_speakers
  has_many :speakers, through: :meeting_speakers

  validate :meeting_date_cannot_be_in_the_past

  def meeting_date_cannot_be_in_the_past
    if time < Time.now
      errors.add(:time, "can't be in the past")
    end
  end
end
