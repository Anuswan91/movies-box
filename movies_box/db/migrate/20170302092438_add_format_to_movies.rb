class AddFormatToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :format_id, :integer
    add_index :movies, :format_id
  end
end
