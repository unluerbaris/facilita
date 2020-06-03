class AddAgeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    User.find_each do |user|
      next unless user.birthday
      user.set_age
      user.save
    end
  end
end
