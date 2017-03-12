class Api::BaseApiController < ActionController::API
	def response_success data = nil
    render json: {
      data: data,
      status: true,
      server: ENV["SERVER_IDENTITY"],
    }
  end

  def response_fail data = nil, status_code = 200
    render json: {
      data: data,
      status: false,
      server: ENV["SERVER_IDENTITY"],
    }, status: status_code
  end
end
