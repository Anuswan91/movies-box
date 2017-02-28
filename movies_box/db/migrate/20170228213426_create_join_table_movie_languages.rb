class CreateJoinTableMovieLanguages < ActiveRecord::Migration
  def change
    create_join_table :movies, :languages do |t|
      t.index :movie_id
      t.index :language_id
    end
  end
end
