Rails.application.routes.draw do
  get 'save_image/new'
  post 'save_image/create'
  get 'home/filter'
  post 'home/destroy'
  get 'feedbacks/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :feedbacks, only: [:new]

  namespace :api do
    resource :feedbacks, only: [:create]
  end
end
