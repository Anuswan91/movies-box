class CreateJoinTableMovieCountry < ActiveRecord::Migration
  def change
    create_join_table :movies, :countries do |t|
      t.index :movie_id
      t.index :country_id
    end
  end
end
