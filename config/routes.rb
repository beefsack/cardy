Cardy::Application.routes.draw do
  match 'users/test_login' => 'users#test_login', :via => :get, :defaults => { :format => 'json' }
  
  match 'users/logout' => 'users#logout', :via => :delete, :defaults => { :format => 'json' }

  resources :user_deck_session_cards, :defaults => { :format => 'json' }

  resources :user_deck_session_card_attempts, :defaults => { :format => 'json' }

  resources :deck_cards, :defaults => { :format => 'json' }

  resources :deck_children, :defaults => { :format => 'json' }

  resources :user_deck_sessions, :defaults => { :format => 'json' }

  resources :decks, :defaults => { :format => 'json' }

  resources :cards, :defaults => { :format => 'json' }
  
  resources :users, :defaults => { :format => 'json' }

  devise_for :users
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
