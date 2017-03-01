class Country < ActiveRecord::Base
  has_many :movie_countries
  has_many :movies, through: :movie_countries

  validates :name, presence: {
    message: "Name must be informed."
  }

  validates :name, uniqueness: {
    message: "Name must be unique."
  }
end
