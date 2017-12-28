Rails.application.routes.draw do
  get '/welcome', to: 'website#welcome'
  get '/about', to: 'website#about'
  get '/contact', to: 'website#contact'

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: redirect('/welcome')
end
