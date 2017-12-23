if defined?(BetterErrors)
  BetterErrors.editor = Rails.configuration.better_errors.editor.to_sym if Rails.configuration.better_errors.editor.present?
  Rails.configuration.better_errors.trusted_ip.split.map { |ip_or_subnet| BetterErrors::Middleware.allow_ip! ip_or_subnet } if Rails.configuration.better_errors.trusted_ip.present?
end
