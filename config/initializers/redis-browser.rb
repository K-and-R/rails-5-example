if defined?(RedisBrowser)
  if Rails.configuration.redis.url.blank?
    Rails.logger.warn 'MISSING REDIS URL'
  else
    RedisBrowser.configure(
      url: Rails.configuration.redis.url
    )
    RedisBrowser::Web.class_eval do
      use Rack::Auth::Basic, "Protected Area" do |username, password|
        username == Rails.configuration.redis_browser.web.username && password == Rails.configuration.redis_browser.web.password
      end
    end
  end
end
