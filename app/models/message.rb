class Message < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :content, presence: true
  acts_as_votable
end
