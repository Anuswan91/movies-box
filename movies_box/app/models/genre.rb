class Genre < ActiveRecord::Base
  has_many :movie_genres
  has_many :movies, through: :movie_genres

  validates :name, presence: {
    message: "Name must be informed."
  }

  validates :name, uniqueness: {
    message: "Name must be unique."
  }
end
