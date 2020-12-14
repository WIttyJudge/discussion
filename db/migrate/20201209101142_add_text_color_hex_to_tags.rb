class AddTextColorHexToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :text_color_hex, :string
    change_column_null :tags, :text_color_hex, true
  end
end
