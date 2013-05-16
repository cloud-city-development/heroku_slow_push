HerokuSlowPush::Application.routes.draw do
  match "/items/background" => "items#background"

  root :to => 'home#index'
end
