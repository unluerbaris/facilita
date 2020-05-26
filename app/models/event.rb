class Event < ApplicationRecord
  has_many :audiences
  has_many :messages
  has_many :questions
  has_many :users, through: :audiences
  belongs_to :user
  validates :title, presence: true
end
