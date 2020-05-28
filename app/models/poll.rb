class Poll < ApplicationRecord
  belongs_to :event

  has_many :choices
  has_many :responses, through: :choices
end
