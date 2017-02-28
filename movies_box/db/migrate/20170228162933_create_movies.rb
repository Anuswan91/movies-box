class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.date :released
      t.integer :runtime
      t.text :plot
      t.float :rating
      t.date :added
      t.boolean :watched

      t.timestamps null: false
    end
  end
end
