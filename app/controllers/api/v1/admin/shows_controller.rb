class Api::V1::Admin::ShowsController < AdminController
  before_action :find_show, only: :show
  before_action :authenticate_user!
  before_action :load_movie_room, except: :index

  def index
    @shows = Show.incre_order
    render json: {
      data: {
        shows: ActiveModelSerializers::SerializableResource.new(
          @shows, each_serializer: ShowSerializer
        )
      },
      message: ["Shows list fetched successfully"],
      status: 200,
      type: "Success"
    }
  end

  def show
    render json: {
      data: {
        shows: ActiveModelSerializers::SerializableResource.new(
          @show, each_serializer: ShowSerializer
        )
      },
      message: ["Show fetched successfully"],
      status: 200,
      type: "Success"
    }
  end

  private

  def show_params
    params.require(:show).permit Show::SHOW_ATTR
  end

  def find_show
    @show = Show.find_by id: params[:id]
    return if @show

    false
  end

  def load_movie_room
    @movies = Movie.active.incre_order
    @rooms = Room.incre_order
  end
end
