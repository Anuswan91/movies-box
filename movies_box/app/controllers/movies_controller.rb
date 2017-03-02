class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
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
                                    :format_id)
    end
end
