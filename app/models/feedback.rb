class Feedback < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :comment, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5,  only_integer: true }
end
