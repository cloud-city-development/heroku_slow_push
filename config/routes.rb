HerokuSlowPush::Application.routes.draw do
  resources :items do
    get :background, on: :collection
  end

  root :to => 'home#index'
end
