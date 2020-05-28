class Feedback < ApplicationRecord
  belongs_to :event

  validates :question, presence: true
end
