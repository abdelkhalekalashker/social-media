class AddAverageRateToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :average_rate, :float, default: 0.0
  end
end
