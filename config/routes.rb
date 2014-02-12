Untitled2::Application.routes.draw do
  #get "password_resets/new"
  #get "relationships/create"
  #get "relationships/destroy"
  #get "microposts/create"
  #get "microposts/destroy"
  # resources genera todas las acciones necesarias para crear, mostrar, modificar, actualizar, destruir
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_confirmation
  resources :password_resets
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  #match '/signin', to: 'sessions#index', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  #get "users/new"
  match '/signup', to: 'users#new', via: 'get'
  #get "static_pages/contact"
  match '/contact', to: 'static_pages#contact', via: 'get'
  #get "static_pages/about"
  match '/about', to: 'static_pages#about', via: 'get'
  #get "static_pages/home"
  root 'static_pages#home'
  #get "static_pages/help"
  match '/help', to: 'static_pages#help', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
