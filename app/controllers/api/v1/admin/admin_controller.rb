class Api::V1::Admin::AdminController < BaseController
  before_action :authenticate_user!, :require_admin

  private
  def require_admin
    return if api_current_user&.admin?

    render json: {message: "User don't have right to access this page",
                  success: false}, status: :unauthorized
  end
end
