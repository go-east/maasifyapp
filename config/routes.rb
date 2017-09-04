Rails.application.routes.draw do
  resources :hacks do
  	collection do
  		get :search
  	end
  end
  devise_for :users
  root to: 'hacks#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
