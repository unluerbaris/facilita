class AddCommentToFeedbacks < ActiveRecord::Migration[6.0]
  def change
    add_column :feedbacks, :comment, :text
  end
end
