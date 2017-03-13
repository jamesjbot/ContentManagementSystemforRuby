Rails.application.routes.draw do

  root :to => 'public#index'
  # we can add our own resourceful route name with :as
  get 'show/:permalink', :to => 'public#show', :as => 'public_show'
 
  get 'admin', :to => 'access#menu' # If the user is logged in send them to the menu if not then they will get the login form
  get 'access/menu' # Simple match route
  get 'access/login' # Simple match route
  post 'access/attempt_login'
  get 'access/logout'

  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do # Resourceful routes
	 member do
		get :delete
	 end
  end

  resources :sections do
  	member do
  		get :delete
  	end
  end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  get 'demo/escape_output'

  get 'test_controller/open'
  get 'test_controller/close'
  get 'test_controller/edit'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
