class AddAboutToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :about, :string, null: false
    change_column_default :tags, :about, ''
    change_column_default :tags, :about, nil
  end
end
