class AddAnswerToResponses < ActiveRecord::Migration[6.0]
  def change
    add_column :responses, :answer, :string
  end
end
