class AddSummeryToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :summery, :string
    change_column_null :users, :summery, true
  end
end
