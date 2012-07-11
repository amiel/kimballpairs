Kimballpairs::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :submissions, only: [:new, :create]
  root to: 'kimball_pairs#index'
end
