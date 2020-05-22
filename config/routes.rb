Rails.application.routes.draw do
  get 'save_image/index'
  post 'save_image/create_image'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
