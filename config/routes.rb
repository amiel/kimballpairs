Kimballpairs::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :submissions, only: [:new, :create]
  get 'kimball_pairs/:id', to: 'kimball_pairs#show'
  root to: 'kimball_pairs#index'
end
