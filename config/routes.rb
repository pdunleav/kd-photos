Rails.application.routes.draw do
  devise_for :users, skip: :registrations, controllers: { registrations: 'registrations' }

  root to: 'pages#home'
  resources :photos, only: %i[new create]
end
