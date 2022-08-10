class MoviesController < ApplicationController
  def index
    @movies_showing = Movie.showing_movie.limitation
    @movies_coming = Movie.incoming_movie.release
  end
end
