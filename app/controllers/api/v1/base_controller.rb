class Api::V1::BaseController < ActionController::Base
  respond_to :json

  rescue_from Exception, with: :handle_api_exceptions

  private

  def handle_api_exceptions(exception)
    log_exception exception
    respond_with_error('Something went wrong. Please try again later.')
  end

  def respond_with_error(message, status = :internal_server_error)
    loga"API: Error message is '#{message}' with status #{status}"
    render json: { error: message }, status: status
  end

  def log_exception(exception)
    Rails.logger.info exception.class.to_s
    Rails.logger.info exception.to_s
    Rails.logger.info exception.backtrace.join("\n")
  end

  def log(message)
    message = "#{self.class.name} #{message}"
    Rails.logger.info message
  end

  def authenticate_external_service!
    access_id = ApiAuth.access_id(request)
    secret_key = access_id && AccessKey.find_by(id: access_id).try(:secret)

    if !(secret_key && ApiAuth.authentic?(request, secret_key))
      log('Could not authenticate with the provided credentials.')
      if secret_key.nil?
        log("Could not find secret key for #{access_id} access id.")
      else
        headers = ApiAuth::Headers.new(request)
        log("Access id: #{access_id}")
        log("Md5 mismatch: #{headers.md5_mismatch?}")
        log("Request too old: #{ApiAuth.send(:request_too_old?, request)}")
        log("Canonical string: #{headers.canonical_string}")
      end
      respond_with_error('Could not authenticate with the provided credentials.', 401)
    end
  end
end