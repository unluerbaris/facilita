class Event < ApplicationRecord
  has_many :audiences, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :polls, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :users, through: :audiences
  has_one_attached :photo
  belongs_to :user
  validates :title, presence: true
  before_validation :add_token

  def add_token
    self.token = SecureRandom.alphanumeric(5).upcase if token.nil?
  end
end

