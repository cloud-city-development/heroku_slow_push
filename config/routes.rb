HerokuSlowPush::Application.routes.draw do
  resources :items do
    get :background, on: :member
  end

  root :to => 'home#index'
end
