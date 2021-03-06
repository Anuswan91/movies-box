class Movie < ActiveRecord::Base
  belongs_to :format

  has_many :movie_languages
  has_many :languages, through: :movie_languages

  has_many :movie_genres
  has_many :genres, through: :movie_genres

  has_many :movie_countries
  has_many :countries, through: :movie_countries

  has_many :movie_subtitles
  has_many :subtitles, through: :movie_subtitles

  has_many :movie_people
  has_many :people, through: :movie_people

  validates :title, presence: {
    message: "Title must be informed."
  }

  def self.search(search)
    moviesReq = Movie.where("title LIKE ?", "%#{search[:title]}%")

    if search[:runtime] != ''
      moviesReq = moviesReq.where("runtime = ?", "#{search[:runtime]}")
    end

    if search[:watched] != ''
      moviesReq = moviesReq.where("watched = ?", search[:watched].to_s == 'true' ? true : false)
    end

    return moviesReq
  end
end
