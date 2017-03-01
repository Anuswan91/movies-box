class DropPeopleMoviesTable < ActiveRecord::Migration
  def change
    def up
      drop_table :movies_people
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
