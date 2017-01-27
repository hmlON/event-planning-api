class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :invites
  has_many :messages

  validates_presence_of :users, :time, :place, :description
  validates_length_of :place, in: (5..50)
  validate :time_cannot_be_in_the_past

  mount_uploaders :attachments, AttachmentUploader

  scope :due, ->(due_time) { where('time <= ?', due_time) }
  scope :interval, ->(time) { where('time <= ?', Time.current + time) }

  private

  def time_cannot_be_in_the_past
    errors.add(:time, "can't be in the past") if time < Time.current
  end
end
