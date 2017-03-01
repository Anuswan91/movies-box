class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def home
  end

  def help
  end

  def about
  end
end
