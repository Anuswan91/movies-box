class AddImagesToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :image, :text
  end
end
