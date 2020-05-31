class RemoveChoiceFromResponses < ActiveRecord::Migration[6.0]
  def change
    remove_column :responses, :choice_id, :references
  end
end
