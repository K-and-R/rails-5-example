class ErrorsController < ApplicationController
  def access_denied
    render_access_denied
  end

  def internal_server_error
    render_error :internal_server_error
  end

  def not_found
    render_not_found
  end
end
