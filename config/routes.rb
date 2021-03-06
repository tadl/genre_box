Rails.application.routes.draw do
  root 'main#index'
  get 'main/index'
  get 'main/about'
  get 'main/leaders'
  get 'main/found'
  get 'main/not_found'
  get 'main/edit'
  get 'main/cancel_edit'
  get 'main/mark_not_found'
  match "main/update_genre" => "main#update_genre", via: [:post], defaults: { format: 'json' }
 # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
 # as :user do
 #    get 'sign_in', :to => "main#index", :as => :new_user_session
 #    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
 # end
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }, skip: [:sessions]
  as :user do
    get 'sign_in', :to => "main#index", :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  match '/:action', :controller => 'main', via: [:get, :post]
  
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
