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
    resources :auctions       
    resources :skills       
    resources :teams       
    resources :players       
  end
  namespace :admin do 
    resources :base
    resources :shops
    resources :offers    
    resources :events
    resources :shop_images 
    resources :single_business_users
    resources :seodetails   
    resources :business_users
    resources :users
  end

  post '/tinymce_assets' => 'tinymce_assets#create'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  #Business User Search for Single shop
  post '/business_user/search' => "business_user/business_users#search"
  get '/business_user/userdetails/:id' => "business_user/business_users#userdetails"
  post '/business_user/dashboard' => "business_user/business_users#show"

  post '/business_user/cropimage' => "business_user/shop_images#crop"  
  post '/business_user/teamplayers/:id' => "business_user/players#teamupdate"  
  # You can have the root of your site routed with "root"  
  get 'aboutus' => "home#about_us"
  get 'contactus' => "home#contact_us"
  post 'contact_us' => "home#update_contact_us"
  get 'gallery' => "home#gallery"
  get 'donation' => "home#donation"
  get 'shopevents' => "home#shop_events"
  get 'sports_1' => "home#sports_1"
  get 'sports_2' => "home#sports_2"
  get 'education_1' => "home#education_1"
  get 'education_2' => "home#education_2"
  get 'education_3' => "home#education_3"
  get 'health_1' => "home#health_1"
  get 'entertainment_1' => "home#entertainment_1"
  get 'auction' => "home#auction"
  get 'players' => "home#players"
  get 'teams' => "home#teams"
  get 'team/:id' => "home#team"
  
   
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
