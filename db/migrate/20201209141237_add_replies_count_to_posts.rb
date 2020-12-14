class AddRepliesCountToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :replies_count, :integer, null: false, default: 0
  end
end
