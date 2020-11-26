class AddLocationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :location, :string
    change_column_null :users, :location, true
  end
end
