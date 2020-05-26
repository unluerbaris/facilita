class AddUserToEvents < ActiveRecord::Migration[6.0]
  def change
    Event.destroy_all
    add_reference :events, :user, null: false, foreign_key: true
  end
end
