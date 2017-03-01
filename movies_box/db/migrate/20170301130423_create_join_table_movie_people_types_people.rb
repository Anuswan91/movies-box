class CreateJoinTableMoviePeopleTypesPeople < ActiveRecord::Migration
  def change
    create_join_table :movies, :people do |t|
      t.index :movie_id
      t.index :people_id
    end
  end
end
