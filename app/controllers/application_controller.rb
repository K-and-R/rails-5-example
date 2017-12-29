class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #######
  # Error handling
  #
  def raven_set_user_context
    Raven.user_context({
      'id' => current_user.id,
      'email' => current_user.email
    }) if current_user
  end

  def raven_clear_user_context
    Raven.user_context({})
  end

  unless Rails.application.config.consider_all_requests_local
    rescue_from(
      ActionController::RoutingError,
      ActionController::UnknownController,
      ::AbstractController::ActionNotFound,
      ActiveRecord::RecordNotFound,
      with: ->(exception) { render_error :not_found, 404, exception }
    )
    rescue_from(
      SecurityError,
      with: ->(exception) { render_error :access_denied, 403, exception }
    )
    rescue_from(
      Exception,
      with: ->(exception) { render_error :internal_server_error, 500, exception }
    )
  end

  def routing_error
    fail ActionController::RoutingError.new 'Page not found'
  end

  def render_access_denied
    render_error :access_denied, 403
  end

  def render_not_found
    render_error :not_found, 404
  end

  def render_error(type, code = 500,  exception = nil)
    # Send exception to Sentry
    capture_exception(exception) if exception
    Rails.logger.error(
      "Rendering error '#{type.to_s}' because of #{exception.class}: "\
      "#{exception.message}"
    ) if exception
    respond_to do |format|
      format.html { render status: code, template: "errors/#{type.to_s}", layout: 'error' }
      format.json { render status: code, text: { error: type.to_s.titleize }.to_json, content_type: Mime::JSON }
      format.text { render status: code, text: type.to_s.titleize }
    end
  end
end
