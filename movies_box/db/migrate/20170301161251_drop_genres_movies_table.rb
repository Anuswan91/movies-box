class DropGenresMoviesTable < ActiveRecord::Migration
  def change
    def up
      drop_table :genres_movies
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
