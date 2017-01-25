class Event < ApplicationRecord
  belongs_to :user
  has_many :invites

  validates_presence_of :user, :time, :place, :description
  validates_length_of :place, in: (5..50)
  validate :time_cannot_be_in_the_past

  private

  def time_cannot_be_in_the_past
    errors.add(:time, "can't be in the past") if time < Time.current
  end
end
