class DropLanguagesMoviesTable2 < ActiveRecord::Migration
  def up
    drop_table :languages_movies
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
