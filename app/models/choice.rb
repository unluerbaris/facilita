class Choice < ApplicationRecord
  belongs_to :poll

  has_many :responses
  validates :answer, presence: :true
end
