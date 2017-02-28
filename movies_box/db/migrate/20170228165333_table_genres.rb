class TableGenres < ActiveRecord::Migration
  def change
    create_table :genres
    add_column :genres, :name, :string
  end
end
