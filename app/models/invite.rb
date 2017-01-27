class Invite < ApplicationRecord
  include PublicActivity::Common
  
  belongs_to :event
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates_presence_of :event, :email, :sender, :recipient, :token

  before_validation :generate_token, :assign_recipient

  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([event, Time.now, rand].join)
  end

  def assign_recipient
    self.recipient = User.find_by_email(email)
  end
end
