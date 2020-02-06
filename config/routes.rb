Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/aboutus'
  root to: 'pages#aboutus', as: 'aboutus'
  #get 'aboutus', to: "aboutus#aboutus"
  get 'contactus', to: "contactus#contactus"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs, only: [:index, :show, :create, :new, :update, :edit] do
    resources :availabilities, only: [:index, :show, :create, :new]
  end
  resources :reviews, only: [:index, :show, :create, :new]
  resources :bookings, only: [:index, :show, :create, :new]
end
