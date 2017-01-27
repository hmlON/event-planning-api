class Message < ApplicationRecord
  include PublicActivity::Common

  belongs_to :user
  belongs_to :event

  validates_presence_of :text
end
