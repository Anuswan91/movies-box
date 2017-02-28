class AddFormat < ActiveRecord::Migration
  def change
    Format.create :name => "mkv"
    Format.create :name => "avi"
    Format.create :name => "mp4"
  end
end
