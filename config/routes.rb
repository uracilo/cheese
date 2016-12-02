Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

	devise_for :users, controllers: {
		 sessions: 'users/sessions',
		 registrations: 'users/registrations',
		 omniauth_callbacks: 'users/omniauth_callbacks'
	} 
	  resources :user_products
	  resources :users
end
