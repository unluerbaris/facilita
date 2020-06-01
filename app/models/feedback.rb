class Feedback < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :comment, presence: true
  validates :rating, presence: true
end
