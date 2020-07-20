class ApplicationController < ActionController::API
  rescue_from Exception, with: :exception_handler

  def exception_handler(exception)
    case exception
    when ActiveRecord::RecordInvalid, ActionController::ParameterMissing
      render json: { message: "Record could not be created. #{exception.to_s}" }, status: :bad_request
    when ActiveRecord::RecordNotFound
      render json: { message: 'That record could not be found.' }, status: :not_found
    end
  end

  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    render json: { message: "Whoops! That path doesn't exist." }, status: :not_found
  end
end
