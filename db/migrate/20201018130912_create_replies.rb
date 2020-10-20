class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.string :reply, null: false
      t.belongs_to :post, foreign_key: true
      t.belongs_to :user, foreign_key: true
    end
  end
end
