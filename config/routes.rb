Rails.application.routes.draw do

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get  'users/register' => 'users#register'
  post 'users/new'      => 'users#new'
  put  'me'             => 'users#me'
  post 'me/update'      => 'users#update'

  put  'login'          => 'sessions#new'
  post 'login'          => 'sessions#create'
  post 'logout'         => 'sessions#destroy'

  post 'contents/upload'  => 'contents#upload'
  post 'contents/destroy' => 'contents#destroy'

  post 'comments/new'     => 'comments#new'
  put  'comments/respond' => 'comments#respond'
  post 'comments/create_response' => 'comments#create_response'

  put '/search' => 'search#search'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
