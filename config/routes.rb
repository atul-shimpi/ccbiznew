Rails.application.routes.draw do
  devise_for :site_users, controllers: {sessions: "sessions"}
  devise_for :admins
  devise_for :business_users
  get 'dashboard/index'
  devise_scope :user do
    get '/site_users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  resources :dashboard
  resources :shops
  resources :offers
  resources :events
  resources :files

  namespace :business_user do 
    resources :base
    resources :shops
    resources :offers
    resources :events    
    resources :shop_images
    resources :shopuserfields
    resources :business_users 
    resources :auctions       
    resources :skills       
    resources :teams       
    resources :players       
    resources :site_users       
    resources :files
    resources :pages
    resources :subscriptions
    resources :payments
    resources :receipts       
    
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
  
  #devise_for :site_users, :controllers => {:registrations => "registrations"}
  post '/tinymce_assets' => 'tinymce_assets#create'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  #Business User Search for Single shop
  post '/business_user/search' => "business_user/business_users#search"
  get '/business_user/userdetails/:id' => "business_user/business_users#userdetails"
  post '/business_user/dashboard' => "business_user/business_users#show"
  get '/files/download/:id' => "files#download"
  get '/business_user/files/approve/:id' => "business_user/files#approve"
  get '/business_user/site_users/properties/:id' => "business_user/site_users#properties"
  get '/business_user/site_users/subscription/:id' => "business_user/site_users#subscriptionlist"

  get '/business_user/templatelist' => "business_user/business_users#templatelist"

  get '/business_user/pages/design/:shop_id/:page_id' => "business_user/pages#design"
  get '/business_user/pages/clone/:shop_id/:page_id' => "business_user/pages#clone"
  

  post '/business_user/pages/designupdate' => "business_user/pages#designupdate"
  post '/business_user/pages/imageupload' => "business_user/pages#imageupload"

  post '/business_user/cropimage' => "business_user/shop_images#crop"  
  post '/business_user/teamplayers/:id' => "business_user/players#teamupdate"  
  get '/business_user/players/:id/playeredit' => "business_user/players#playeredit"
  get '/business_user/players/:id/no_auction' => "business_user/players#no_auction"  
  get '/business_user/pages/design/:shop_id/:page_id' => "business_user/pages#design"
  get '/payment_reciept/:payment_id/:public_token' => "business_user/receipts#public_show"
  get '/business_user/shops/design/:shop_id' => "business_user/shops#design"
  get '/business_user/shops/header/:shop_id' => "business_user/shops#shopheader"
  get '/business_user/shops/footer/:shop_id' => "business_user/shops#shopfooter"
  get '/business_user/shops/receiptheader/:shop_id' => "business_user/shops#shoprecieptheader"
  get '/business_user/shops/receiptfooter/:shop_id' => "business_user/shops#shoprecieptfooter"
  get '/business_user/shops/getlayout/:type/:shop_id' => "business_user/shops#getlayout"
  post '/business_user/shops/layoutupdate/:type' => "business_user/shops#updatelayout"
  get '/business_user/receipts/sendmail/:id' => "business_user/receipts#sendmail"
  post '/business_user/payments/update/' => "business_user/payments#update"
  get '/business_user/payments/getdetails/:paymentid/:status' => "business_user/payments#getdetails"
  
  # You can have the root of your site routed with "root"  
  get 'aboutus' => "home#about_us"
  get 'user/dashboard' => "home#dashboard"
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
  get 'entertainment_2' => "home#entertainment_2"
  get 'entertainment_3' => "home#entertainment_3"
  get 'food_1' => "home#food_1"
  get 'food_2' => "home#food_2"
  get 'clothes_1' => "home#clothes_1"
  get 'clothes_2' => "home#clothes_2"
  get 'social_1' => "home#social_1"
  get 'social_2' => "home#social_2"
  get 'social_3' => "home#social_3"
  get 'footwear_1' => "home#footwear_1"
  get 'home' => "home#home"
  get 'auction' => "home#auction"
  get 'teams' => "home#teams"
  get 'team/:id' => "home#team"
  get 'compare_teams' => "home#compare_teams"
  get 'player/:id' => "home#player"
  get 'sitemap.xml' => "home#sitemap", :format => "xml", :as => :sitemap
  get 'robots.txt' => "home#robots", :format => "txt", :as => :robots
  
  get ':slug' => "home#pageshow"

  get 'create' => "home#create"
  get 'edit_project' => "home#edit_project"
  get 'activate_project' => "home#activate_project"
  
  #Routes for sites users
  get '/user/updatepayment' => "home#updatepayment"
  post '/user/paymentupdate' => "payments#create"
   
  match '/', to: 'home#index', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]
  root 'home#index'
  
  ### Routes for HTML Builder Elements (Please add block routes here only)###

  get "/business_user/elements/:page" => "business_user/elements#show"
  
  ### Routes for HTML Builder Elements (END) ###

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
