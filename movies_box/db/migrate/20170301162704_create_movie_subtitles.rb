class CreateMovieSubtitles < ActiveRecord::Migration
  def change
    create_table :movie_subtitles do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :subtitle, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
