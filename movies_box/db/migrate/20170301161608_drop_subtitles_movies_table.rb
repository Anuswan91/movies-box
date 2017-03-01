class DropSubtitlesMoviesTable < ActiveRecord::Migration
  def change
    def up
      drop_table :movies_subtitles
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
