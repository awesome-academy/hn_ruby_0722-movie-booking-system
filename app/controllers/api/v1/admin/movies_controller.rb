class Api::V1::Admin::MoviesController < AdminController
  before_action :find_movie, only: :show
  before_action :authenticate_user!

  def index
    @movies = Movie.active
    render json: {
      data: {
        movies: ActiveModelSerializers::SerializableResource.new(
          @movies, each_serializer: MovieSerializer
        )
      },
      message: ["Active movies list fetched successfully"],
      status: 200,
      type: "Success"
    }
  end

  def show
    render json: {
      data: {
        movies: ActiveModelSerializers::SerializableResource.new(
          @movie, each_serializer: MovieSerializer
        )
      },
      message: ["Movie fetched successfully"],
      status: 200,
      type: "Success"
    }
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      render json: {
        message: ["Movie created successfully"],
        status: 200,
        type: "Success"
      }
    else
      render json: {
        errors: @movie.errors.messages,
        message: ["Movie created failed"],
        status: 401,
        type: "Unsuccess"
      }
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end

  def find_movie
    @movie = Movie.find_by id: params[:id]
    return if @movie

    render json: {
      message: ["Movie not found"],
      status: 401,
      type: "Unsuccess"
    }
  end

  def load_genre
    @genres = Genre.asc_genre_name
  end
end
