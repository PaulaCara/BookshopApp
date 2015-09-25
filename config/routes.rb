BookshopApp::Application.routes.draw do

  devise_for :users, controllers: { sessions: "users/sessions", passwords: "devise/passwords",
                                    registrations: "devise/registrations", confirmations: "devise/confirmations" }
  root 'static_pages#home'

  resources :products do
    collection do
      get 'search'
    end
  end

  resource :cart do
    member do
      post 'add_to'
      post 'remove_from'
      get 'remove_all_cart_items'
      post 'update_cart_items'
    end
  end
  
  namespace :admin do
    # resources :users do
    #   member do
    #     post 'change_status'
    #   end
    # end

    resources :products
  end

  resource :checkout do
    member do
      get 'billing_information'
      post 'create_billing_address'
      get 'shipping_information'
      post 'create_shipping_address'
      get 'shipping_method'
      post 'add_shipping_method'
      get 'payment_method'
      post 'add_payment_method'
      get 'order_review'
      get 'place_order'
      get 'order_details'
    end
  end

  resources :categories
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