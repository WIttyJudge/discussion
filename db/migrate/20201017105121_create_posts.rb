class CreatePosts < ActiveRecord::Migration[6.0]
	def change
		create_table :posts do |t|
			t.string :title, null: false
			t.text :body, null: false
      t.string :slug
      t.belongs_to :author, foreign_key: { to_table: :users }

			t.timestamps
		end
	end
end