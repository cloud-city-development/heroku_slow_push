HerokuSlowPush::Application.routes.draw do
  resources :items, :only => [:background] do
    get :background, on: :collection
  end

  root :to => 'home#index'
end
