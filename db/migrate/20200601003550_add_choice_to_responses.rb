class AddChoiceToResponses < ActiveRecord::Migration[6.0]
  def change
    add_reference :responses, :choice, null: false, foreign_key: true
  end
end
