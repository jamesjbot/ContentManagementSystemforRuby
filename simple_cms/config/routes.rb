Rails.application.routes.draw do
  
  root 'demo#index'

  get 'test_controller/open'

  get 'test_controller/close'

  get 'test_controller/edit'

  get 'demo/index'

  get 'demo/hello'

  get 'demo/other_hello'

  get 'demo/lynda'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
