Rails.application.routes.draw do
  get 'static_pages/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  resources :landscape
  resources :catalog
  resources :qsizer
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  post 'users/login' => 'login#login'
  get 'qsizer/:catalog/:product' => 'qsizer#platforms'
  get 'qsizer/:product/:platform/:id' => 'qsizer#components'
  post 'analyze/data' => 'qsizer#output'
  get 'admin/resourceweightage/:id' => 'admin#getresource'
  post 'admin/resourceweightage/' => 'admin#setresource'
  get 'admin/bladeparameters/:id' => 'admin#getparametersperblade'
  post 'admin/bladeparameters/' => 'admin#setparametersperblade'
  get 'admin/assumptionstarget/:id' => 'admin#getassumptionstarget'
  post 'admin/assumptionstarget/' => 'admin#setassumptionstarget'
  get 'admin/design/:landscape' => 'admin#getdesignrationale'
  post 'admin/design/' => 'admin#setdesignrationale'
  get 'admin/apptodb/:id' =>'admin#getapptodb'
  post 'admin/apptodb/' =>'admin#setapptodb'
  get 'admin/vmware/:id' => 'admin#getvmhaserverreqq'
  post 'admin/vmware/' => 'admin#setvmhaserverreqq'
  get 'admin/infra' => 'admin#getinfracatlogvalues'
  post 'admin/infrastructure' =>'admin#setinfracatlogvalues'
  get 'admin/qsizer' => 'admin#getquicksizervalues'
  post 'admin/quicksizer' => 'admin#setquicksizervalues'
  get 'admin/server' => 'admin#getservervalues'
  post 'admin/servercomponent' => 'admin#setservervalues'
  
  get '/home' => 'static_pages#index'
  root 'static_pages#index'
  

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
