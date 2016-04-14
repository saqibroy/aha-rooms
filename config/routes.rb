Rails.application.routes.draw do
   

  resources :reservations
  resources :rooms
  get 'home/index'
  get 'home/about'
  get 'home/contact'

  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => "sessions" }
  get "/admin" => "admin#index", :as => 'admin'
  get 'admin/hotels'
  get 'admin/hotel_show'
  get 'admin/rooms'
  get 'admin/room_show'
  delete 'admin/image_delete'
  get 'admin/user_request'
  get 'admin/user_request_done'
  delete 'admin/user_destroy'
  get 'admin/user_data'
  get 'admin/user_new'
  post 'admin/user_create'
  get 'admin/user_edit'
  put 'admin/user_update'
  delete 'admin/feature_destroy'
  get 'admin/features'
  get 'admin/feature_new'
  post 'admin/feature_create'
  get 'admin/reservation_cancel'
  get 'admin/cancel_requests'
  get 'admin/request_deny'
  get 'admin/testimonial_new'
  post 'admin/testimonial_create'
  post 'home/reservation_new'

  resources :hotels
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
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
