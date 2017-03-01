class Language < ActiveRecord::Base
  has_many :movie_languages
  has_many :movies, through: :movie_languages

  validates :name, presence: {
    message: "Name must be informed."
  }

  validates :name, uniqueness: {
    message: "Name must be unique."
  }
end
