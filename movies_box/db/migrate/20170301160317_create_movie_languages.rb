class CreateMovieLanguages < ActiveRecord::Migration
  def change
    create_table :movie_languages do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
