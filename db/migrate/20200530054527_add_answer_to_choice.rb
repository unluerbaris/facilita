class AddAnswerToChoice < ActiveRecord::Migration[6.0]
  def change
    add_column :choices, :answer, :string
  end
end
