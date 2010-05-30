ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  map.admin "/admin", :controller => "admin/relizs"

  map.namespace :admin do |admin|
    admin.resources :categories 
    admin.resources :subcategories
    admin.resources :relizs, :member => {:remove_poster => :delete, :remove_screenshot => :delete, 
                                         :remove_file_reliz => :delete, :screenshots => :get,
                                         :upload_files => :get}
    admin.resources :users, :member => {:remove_avatar => :delete}
  end

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  map.resource :user_session
  map.resource :account, :controller => "users"

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  map.resources :users, :member => {:remove_avatar => :delete}

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.root   :controller => 'categories', :action => 'index'

  # See how all your routes lay out with "rake routes"
  map.categories '/categories', :controller => 'categories'
  map.subcategories '/:category_name/subcategories', :controller => 'subcategories'
  map.subcategory_relizs '/relizs/:subcategory_name', :controller => 'relizs'
  map.reliz '/reliz/show/:id', :controller => 'relizs', :action => "show"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
