class RemovePollFromChoices < ActiveRecord::Migration[6.0]
  def change
    remove_column :choices, :poll_id, :references
  end
end
