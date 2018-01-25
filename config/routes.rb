Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
  	get 'login' => :new
  	post 'login' => :create
  	delete 'logout' => :destroy
  end

  resources :users
  #resources :orders
  #resources :line_items
  #resources :carts
  #get 'store/index'

  resources :products do
  	get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '(:locale)' do
  	resources :orders
  	resources :line_items
  	resources :carts
  	root 'store#index', as: 'store'
  end



  #root 'store#index', as: 'store'
end
