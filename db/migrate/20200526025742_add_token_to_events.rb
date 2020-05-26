class AddTokenToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :token, :string, limit: 5
    add_index :events, :token, unique: true
  end
end
