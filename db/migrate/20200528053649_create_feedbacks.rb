class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :question
      t.references :event, null: false, foreign_key: true
      t.references :feedback_answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
