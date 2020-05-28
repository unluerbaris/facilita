class AddEventToFeedback < ActiveRecord::Migration[6.0]
  def change
    add_reference :feedbacks, :event, null: false, foreign_key: true
  end
end
