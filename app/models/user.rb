class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :notifications, foreign_key: :recipient_id
  has_many :responses
  has_many :audiences
  has_many :messages
  has_many :questions
  has_many :attended_events, through: :audiences, source: :event
  has_many :events
  has_one_attached :photo

  acts_as_voter

def age
  now = Time.now.utc.to_date
  now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
end

end
