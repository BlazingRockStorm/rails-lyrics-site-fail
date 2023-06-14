Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  namespace :admin do
    resources :genres
  end
  resources :songs

  namespace :api do
    resources :songs, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
