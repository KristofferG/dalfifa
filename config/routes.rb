Rails.application.routes.draw do
  #get 'admin/index'
  #get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :users
  get 'welcome/index'

  match 'matches/all/edit' => 'matches#edit_matches', :as => :edit_matches, :via => :get
  match 'matches/all' => 'matches#update_matches', :as => :update_matches, :via => :put

  resources :cups do
    resources :matches
    resources :fixtures
    resources :comments
  end

  resources :matches do
    get 'edit_matches', on: :collection
    get 'update_matches', on: :collection
    resources :results
    member do
      get 'update_matches'
    end
  end


  resources :players do
    resources :results
  end

  resources :fixtures, :results

  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :created
    delete 'logout' => :destroy
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
