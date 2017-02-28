class CreateJoinTableMoviePerson < ActiveRecord::Migration
  def change
    create_join_table :movies, :persons do |t|
      t.index :movie_id
      t.index :person_id
    end
  end
end
