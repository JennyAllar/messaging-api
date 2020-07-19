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
    when ActiveRecord::RecordNotFound
      render json: { message: 'That record could not be found.' }, status: :not_found
    else
      render json: { message: 'Internal error' }, status: :internal_server_error
    end
  end

  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    render json: { message: "Whoops! That path doesn't exist." }, status: :not_found
  end
end
