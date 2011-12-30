Mgr::Application.routes.draw do

  resources :posts

  root :to => 'home#index'

  get "home/index"

  devise_for :users
    
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end

  get "/forum" => "posts#index"
  

end
