# Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
if Rails.configuration.app.force_ssl
  Rails.application.config.force_ssl = true
end
