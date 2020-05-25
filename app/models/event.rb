class Event < ApplicationRecord
  validates :title, presence: true
  has_many :audiences
  has_many :messages
  has_many :questions
  has_many :users, through: :audiences
end
