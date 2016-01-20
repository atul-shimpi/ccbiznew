Rails.application.routes.draw do
  devise_for :admins
  devise_for :business_users
  get 'dashboard/index'

  devise_for :users
  resources :dashboard
  resources :shops
  resources :offers
  resources :events

  namespace :business_user do 
    resources :base
    resources :shops
    resources :offers
    resources :events    
    resources :shop_images    
    resources :business_users    
  end
  namespace :admin do 
    resources :base
    resources :shops
    resources :offers    
    resources :events
    resources :shop_images 
    resources :single_business_users   
  end

  post '/tinymce_assets' => 'tinymce_assets#create'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  #Business User Search for Single shop
  post '/business_user/search' => "business_user/business_users#search"
  get '/business_user/userdetails/:id' => "business_user/business_users#userdetails"

  # You can have the root of your site routed with "root"  
  get 'about_us' => "home#about_us"
  get 'contact_us' => "home#contact_us"
  get 'gallery' => "home#gallery"
  get 'donation' => "home#donation"
  get 'shop_events' => "home#shop_events"
   
    match '/', to: 'home#index', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]
  root 'home#index'
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
