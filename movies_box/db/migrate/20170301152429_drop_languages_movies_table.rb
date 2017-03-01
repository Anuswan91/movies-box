class DropLanguagesMoviesTable < ActiveRecord::Migration
  def up
    drop_table :languages_movies
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
