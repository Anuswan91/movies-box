class TableLanguages < ActiveRecord::Migration
  def change
    create_table :languages
    add_column :languages, :name, :string
  end
end
