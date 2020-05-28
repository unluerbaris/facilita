class AddQuestionToFeedback < ActiveRecord::Migration[6.0]
  def change
    add_column :feedbacks, :question, :string
  end
end
