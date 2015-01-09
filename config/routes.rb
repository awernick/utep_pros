Rails.application.routes.draw do


  get 'conversations/new'

  get 'conversations/create'

  resources :activities
  resources :subscriptions
  resources :dashboard
  resources :events
  resources :users
  resources :evaluations

  get 'dashboard/new'
  get 'dashboard/create'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'evaluations/create'
  get 'evaluations/create'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  #Front End Static Pages
  root 'static_pages#home'
  match '/contact', to: 'static_pages#contact', as: 'contact', via: [:get, :post]
  match '/about', to: 'static_pages#about', as: 'about', via: [:get, :post]

  #Single Sign On Routes
  match '/create_session', to: 'sessions#create', as: 'create_session', via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  #Routes for conversations
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
    collection do
      get :trashbin
      post :empty_trash
    end
  end
  resources :messages do
    member do
      post :new
    end
  end

  #Administration Backend Routes
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
