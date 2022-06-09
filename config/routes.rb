Rails.application.routes.draw do
  resources :restaurants, only: [ :create, :new, :index, :show ] do
    resources :reviews, only: [ :create]
  end
end
