Rails.application.routes.draw do
  root to: 'goals#index'
  resource :goals
  devise_for :users
end
