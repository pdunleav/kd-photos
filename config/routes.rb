Rails.application.routes.draw do
  devise_for :users, skip: :registrations, controllers: { registrations: 'registrations' },
                     path: '', path_names: { sign_in: ENV['LOGIN_PATH'] }

  root to: 'pages#home'
  resources :photos, only: %i[new create]
end
