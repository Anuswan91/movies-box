class TableFormats < ActiveRecord::Migration
  def change
    create_table :formats
    add_column :formats, :name, :string
  end
end
