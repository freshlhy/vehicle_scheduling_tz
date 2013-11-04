VehicleScheduling::Application.routes.draw do

  resources :groups

  resources :destinations

  resources :trips

  resources :cars

  namespace :admins do

    resources :trips
    resources :cars
    resources :drivers
    resources :workers
    resources :groups
    resources :destinations
    resources :notes

    resources :accidents
    resources :plms
    resources :parts

    match '/add-accident', to: "add_accident#new"
    match '/add-plm', to: "add_plm#new"

    match '/workers-history', to:"workers_history#index"
    match '/workers-history/:id/edit' => 'workers_history#edit'
    match '/workers-history/:id' => 'workers_history#update', :via => :put
    match '/workers-history/:id' => 'workers_history#destroy', :via => :delete

    match '/drivers-history', to:"drivers_history#index"
    match '/drivers-history/:id/edit' => 'drivers_history#edit'
    match '/drivers-history/:id' => 'drivers_history#update', :via => :put
    match '/drivers-history/:id' => 'drivers_history#destroy', :via => :delete

  end

  namespace :drivers do

    match '/start',           to:"status#start"
    match '/tour',           to:"status#tour"
    match '/update',           to:"status#update"

    resources :trips

    match '/driver-history', to:"driver_history#index"
  end

  namespace :workers do
    match '/start',           to:"status#start"
    match '/tour',            to:"status#tour"
    match '/update',           to:"status#update"

    resources :trips

    match '/worker-history', to:"worker_history#index"
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  #static pages
  # root to:"index_page#index"
  root to:"sessions#new"

  match '/index', to:"index_page#index"

  match '/about', to:"static_pages#about"

  match '/help', to:"static_pages#help"

  match '/contact', to:"static_pages#contact"

  # user pages
  match '/signup',  to:'users#new'
  match '/signin',  to:'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end
