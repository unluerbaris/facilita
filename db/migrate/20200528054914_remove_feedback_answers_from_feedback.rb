class RemoveFeedbackAnswersFromFeedback < ActiveRecord::Migration[6.0]
  def change
    remove_reference :feedbacks, :feedback_answers, null: false, foreign_key: true
  end
end
