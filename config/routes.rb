Rails.application.routes.draw do
  get 'about', to: 'pages#about'
  get '/', to: 'breeds#index'
  root 'rails/health#show' 
  resources :breeds, only: [:index, :show]
  resources :breeds
end
