class RemoveAnswerFromResponses < ActiveRecord::Migration[6.0]
  def change
    remove_column :responses, :answer, :string
  end
end
