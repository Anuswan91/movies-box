class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @genres = @movie.genres
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
    idMovie = Movie.last.id # TODO check if we can get @movie.id
  
    array_params[:genres].each do |genre|
      MovieGenre.create movie_id: idMovie, genre_id: genre
    end

    if @movie.save
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
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
      params.require(:movie).permit(:genres => [])
    end
end
