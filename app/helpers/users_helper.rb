module UsersHelper
  def is_booking? seat, show_id
    seat.ticket&.find_by(show_id: show_id)
  end

  def api_current_user
    token = request.headers["Authorization"].split(" ")[1]
    user_id = JsonWebToken.decode(token)["user_id"] if token
    @api_current_user ||= User.find_by(id: user_id)
  end
end
