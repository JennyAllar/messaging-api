class ApplicationController < ActionController::API
  unless Rails.env.development?
    rescue_from Exception, with: :exception_handler
  end

  def exception_handler(exception)
    case exception
    # You can define your own exception somewhere
    # raise it in the code and catch here
    when ActiveRecord::RecordInvalid
      render json: { message: "Record could not be created. #{exception}" }, status: :bad_request
    when ActionController::UnknownFormat, ActionController::InvalidCrossOriginRequest
      render json: { message: 'Bad request' }, status: :unprocessable_entity
    when ActiveRecord::RecordNotFound, ActionController::RoutingError
      render json: { message: 'Not found' }, status: :not_found
    else
      render json: { message: 'Internal error' }, status: :internal_server_error
    end
  end

  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    render json: { message: "Sorry! Can't find that!" }, status: :not_found
  end
end
