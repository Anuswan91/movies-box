class AddJobToMoviePerson < ActiveRecord::Migration
  def change
    add_column :movie_people, :job_id, :integer
    add_index :movie_people, :job_id
  end
end
