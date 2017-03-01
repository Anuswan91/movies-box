class DropCountriesMoviesTable < ActiveRecord::Migration
  def change
    def up
      drop_table :countries_movies
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
