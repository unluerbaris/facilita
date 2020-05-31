class Event < ApplicationRecord
  has_many :audiences
  has_many :messages
  has_many :questions
  has_many :polls
  has_many :users, through: :audiences
  has_one_attached :photo
  belongs_to :user
  validates :title, presence: true
  before_validation :add_token

  def add_token
    self.token = SecureRandom.alphanumeric(5).upcase if token.nil?
  end
end

