Rails.application.routes.draw do
  get '/welcome', to: 'website#welcome'
  get '/about', to: 'website#about'
  get '/contact', to: 'website#contact'

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: redirect('/welcome')

  # Redirect to custom error pages
  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#access_denied"
  get "/500", :to => "errors#internal_server_error"

  # Must be last in line
  # Catch unroutable paths and send to the routing error handler
  match '*fail', to: 'website#routing_error', via: :all
end
