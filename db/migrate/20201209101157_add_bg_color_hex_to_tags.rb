class AddBgColorHexToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :bg_color_hex, :string
    change_column_null :tags, :bg_color_hex, true
  end
end
