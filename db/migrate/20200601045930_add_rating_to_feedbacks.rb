class AddRatingToFeedbacks < ActiveRecord::Migration[6.0]
  def change
    add_column :feedbacks, :rating, :integer
  end
end
