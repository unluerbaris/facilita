class Poll < ApplicationRecord
  belongs_to :event
  has_many :choices
  has_many :responses, through: :choices
  accepts_nested_attributes_for :choices

  validates :title, presence: :true
end
