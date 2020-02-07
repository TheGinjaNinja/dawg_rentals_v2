Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/update'


  devise_for :users
  root to: 'pages#home'
  get 'aboutus', to: "aboutus#aboutus"
  get 'contactus', to: "contactus#contactus"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs, only: [:index, :show, :create, :new, :update, :edit] do
    resources :availabilities, only: [:index, :show, :create, :new]
    resources :bookings, only: [:index, :show, :create, :new]
  end
  resources :reviews, only: [:index, :show, :create, :new]
end
