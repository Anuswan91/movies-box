class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @genres = @movie.genres
    @countries = @movie.countries
    @languages = @movie.languages
    @subtitles = @movie.subtitles
  end

  def new
    @formats = Format.all
    @genres = Genre.all
    @countries = Country.all
    @languages = Language.all
    @subtitles = Subtitle.all
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
    idMovie = Movie.last.id # TODO check if we can get @movie.id

    array_params[:genres].each do |genre|
      MovieGenre.create movie_id: idMovie, genre_id: genre
    end

    array_params[:countries].each do |country|
      MovieCountry.create movie_id: idMovie, country_id: country
    end

    array_params[:languages].each do |language|
      MovieLanguage.create movie_id: idMovie, language_id: language
    end

    array_params[:subtitles].each do |subtitle|
      MovieSubtitle.create movie_id: idMovie, subtitle_id: subtitle
    end
    # redirect_to "/movies"
  end

  def home
  end

  def help
  end

  def about
  end

  private

    def movie_params
      params.require(:movie).permit(:title,
                                    :released,
                                    :runtime,
                                    :plot,
                                    :rating,
                                    :added,
                                    :watched,
                                    :format_id,
                                    :image)
    end

    def array_params
      params.require(:movie).permit(:genres => [],
                                    :countries => [],
                                    :languages => [],
                                    :subtitles => [])
    end
end
