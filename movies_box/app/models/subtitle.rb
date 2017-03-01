class Subtitle < ActiveRecord::Base
  has_many :movie_subtitles
  has_many :movies, through: :movie_subtitles

  validates :name, presence: {
    message: "Name must be informed."
  }

  validates :name, uniqueness: {
    message: "Name must be unique."
  }
end
