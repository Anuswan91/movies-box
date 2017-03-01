class CreateMovieCountries < ActiveRecord::Migration
  def change
    create_table :movie_countries do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
