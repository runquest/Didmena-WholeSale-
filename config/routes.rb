Rails.application.routes.draw do
  
  # match '/:locale' => 
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

  root "welcome#index"

    get '/cart' => 'cart#index'
    post '/cart' => 'cart#add'
    delete ':id' => 'cart#destroy'
    get '/cart/clear' => 'cart#clearCart'
    get '/cls' => 'domains#colors'
    get '/models/size' => 'models#size'
    post '/products/remove' => 'products#remove'
    post '/products/delete_item' => 'products#delete_item'
    get '/models/:id/add_products' => 'models#add_products'
    get '/admin' => 'welcome#admin'
    put '/products_update' => 'products#update_product'
    post '/delete_products' => 'products#delete_products'
    post '/email_sent' => 'welcome#email_sent'
    get '/my_orders/' => 'orders#my_orders'

    resources :purchases
    resources :order_products
    resources :sessions, only: [:new, :create, :destroy]
    resources :orders
    resources :prices
    resources :products
    resources :models
    resources :representatives
    resources :companies
    resources :users
    resources :domains
    resources :sizes
    resources :colors
    resources :model_attachments
    resources :model_pictures
    # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # # match '/:locale' => 
  # scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  # You can have the root of your site routed with "root"
    # root "welcome#index"

    # get 'cart' => 'carts#show'
    # get 'order' => 'order_products#create'

    # resources :users
    # resources :products
    # resources :sessions, only: [:new, :create, :destroy]
    # resources :models
    # resources :types
    # resources :collections
    # resources :representatives

  end


  # Example of regular route:
    # get 'products/:id' => 'catalog#view'

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
