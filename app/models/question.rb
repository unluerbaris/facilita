class Question < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :content, presence: true

  acts_as_votable
end

@question = Question.new(content: 'Question!')
@question.save


@question.votes_for.size # => 1
