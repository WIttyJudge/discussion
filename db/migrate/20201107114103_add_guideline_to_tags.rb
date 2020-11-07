class AddGuidelineToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :guideline, :string, null: false, default: ''
    change_column_default :tags, :guideline, nil
  end
end
