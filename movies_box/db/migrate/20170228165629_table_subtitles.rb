class TableSubtitles < ActiveRecord::Migration
  def change
    create_table :subtitles
    add_column :subtitles, :name, :string
  end
end
