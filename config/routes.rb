Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'aboutus', to: "aboutus#aboutus"
  get 'contactus', to: "contactus#contactus"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs, only: [:index, :show, :create, :new, :update, :edit, :destroy] do
    resources :availabilities, only: [:index, :show, :create, :new]
    resources :bookings, only: [:create, :new, :show]
  end
  resources :bookings, only: [:index, :destroy, :update, :edit]
  resources :reviews, only: [:index, :show, :create, :new]

  get 'dashboard', to: "pages#dashboard", as: :dashboard
end
