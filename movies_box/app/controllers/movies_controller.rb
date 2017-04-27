class MoviesController < ApplicationController
  def index
    movies = Array.new
    Movie.all.each do |movie|
      movies.push(getMovieComplete(movie))
    end
    @movies = movies # Movie.all
    @allFormats = Format.all
    @allGenres = Genre.all
    @allCountries = Country.all
    @allLanguages = Language.all
    @allSubtitles = Subtitle.all
  end

  def getMovieComplete(movie)
    tmp = { id: movie.id,
            title: movie.title,
            released: movie.released,
            runtime: movie.runtime,
            plot: movie.plot,
            rating: movie.rating,
            added: movie.added,
            image: movie.image,
            watched: movie.watched,
            format_id: movie.format_id,
            genres: movie.genres,
            countries: movie.countries,
            languages: movie.languages,
            subtitles: movie.subtitles
          }
    return tmp
  end

  def show
    @movie = Movie.find(params[:id])
    @genres = @movie.genres
    @countries = @movie.countries
    @languages = @movie.languages
    @subtitles = @movie.subtitles
    # render json: [@genres, @countries, @languages, @subtitles]
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save

    if( !array_params[:genres].nil? )
      array_params[:genres].each do |genre|
        MovieGenre.create movie_id: @movie.id, genre_id: genre.to_i
      end
    end

    if( !array_params[:countries].nil? )
      array_params[:countries].each do |country|
        MovieCountry.create movie_id: @movie.id, country_id: country
      end
    end

    if( !array_params[:languages].nil? )
      array_params[:languages].each do |language|
        MovieLanguage.create movie_id: @movie.id, language_id: language
      end
    end

    if( !array_params[:subtitles].nil? )
      array_params[:subtitles].each do |subtitle|
        MovieSubtitle.create movie_id: @movie.id, subtitle_id: subtitle
      end
    end

    render json: getMovieComplete(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])

    if( !@movie.movie_genres.nil? )
      @movie.movie_genres.each do |movie_genre|
        movie_genre.destroy
      end
    end

    if( !@movie.movie_subtitles.nil? )
      @movie.movie_subtitles.each do |movie_subtitle|
        movie_subtitle.destroy
      end
    end

    if( !@movie.movie_languages.nil? )
      @movie.movie_languages.each do |movie_language|
        movie_language.destroy
      end
    end

    if( !@movie.movie_countries.nil? )
      @movie.movie_countries.each do |movie_country|
        movie_country.destroy
      end
    end

    @movie.destroy

    head :no_content
  end

  def update
    @movie = Movie.find(params[:id])

    if( !@movie.movie_genres.nil? )
      @movie.movie_genres.each do |movie_genre|
        movie_genre.destroy
      end
    end

    if( !@movie.movie_subtitles.nil? )
      @movie.movie_subtitles.each do |movie_subtitle|
        movie_subtitle.destroy
      end
    end

    if( !@movie.movie_languages.nil? )
      @movie.movie_languages.each do |movie_language|
        movie_language.destroy
      end
    end

    if( !@movie.movie_countries.nil? )
      @movie.movie_countries.each do |movie_country|
        movie_country.destroy
      end
    end

    if( !array_params[:genres].nil? )
      array_params[:genres].each do |genre|
        MovieGenre.create movie_id: params[:id], genre_id: genre
      end
    end

    if( !array_params[:countries].nil? )
      array_params[:countries].each do |country|
        MovieCountry.create movie_id: params[:id], country_id: country
      end
    end

    if( !array_params[:languages].nil? )
      array_params[:languages].each do |language|
        MovieLanguage.create movie_id: params[:id], language_id: language
      end
    end

    if( !array_params[:subtitles].nil? )
      array_params[:subtitles].each do |subtitle|
        MovieSubtitle.create movie_id: params[:id], subtitle_id: subtitle
      end
    end

    if @movie.update(movie_params)
      render json: getMovieComplete(@movie)
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def home
  end

  def new
    # @formats = Format.all
    # @genres = Genre.all
    # @countries = Country.all
    # @languages = Language.all
    # @subtitles = Subtitle.all
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
