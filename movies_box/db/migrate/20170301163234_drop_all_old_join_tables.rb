class DropAllOldJoinTables < ActiveRecord::Migration
  def change
    drop_table :countries_movies
    drop_table :genres_movies
    drop_table :movies_people
    drop_table :movies_subtitles
  end
end
