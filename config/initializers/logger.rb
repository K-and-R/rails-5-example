Rails.application.configure do
  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new
  config.log_level = Rails.configuration.app.log_level.to_sym

  # Disable automatic flushing of the log to improve performance.
  # config.autoflush_log = false

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :request_id ] # Rails 5

  if Rails.configuration.app.log_to_stdout.present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
end
