class CreateLanguagesMovies < ActiveRecord::Migration
  def change
    create_table :languages_movies do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true
    end
  end
end
