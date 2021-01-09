class AddReadingTimeToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :reading_time, :integer, default: 1
  end
end
