Rails.application.configure do
  # Show or hide full error reports.
  config.consider_all_requests_local = !!Rails.configuration.app.consider_requests_local
end
