class DropMoviesPerson < ActiveRecord::Migration
  def up
    drop_table :movies_person
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
