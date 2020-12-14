class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.belongs_to :post, foreign_key: true
      t.belongs_to :user, foreign_key: true
    end
  end
end
