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
  root to:"index_page#index"

  match '/about', to:"static_pages#about"

  match '/help', to:"static_pages#help"

  match '/contact', to:"static_pages#contact"

  # user pages
  match '/signup',  to:'users#new'
  match '/signin',  to:'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete


  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
