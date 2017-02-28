class CreateJoinTableMovieSubtitle < ActiveRecord::Migration
  def change
    create_join_table :movies, :subtitles do |t|
      t.index :movie_id
      t.index :subtitle_id
    end
  end
end
