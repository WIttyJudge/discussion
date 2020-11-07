class AddAboutToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :about, :string, null: false, default: ''
    change_column_default :tags, :about, nil
  end
end
