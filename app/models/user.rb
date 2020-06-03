class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :notifications, foreign_key: :recipient_id
  has_many :responses, dependent: :destroy
  has_many :audiences, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :attended_events, through: :audiences, source: :event
  has_many :events, dependent: :destroy
  has_one_attached :photo
  before_create :set_age
  acts_as_voter

  def set_age
    if birthday
      now = Time.now.utc.to_date
      new_age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
      self.age = new_age
    end
  end

end
