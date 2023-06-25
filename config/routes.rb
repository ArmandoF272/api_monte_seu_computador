Rails.application.routes.draw do
  resources :pedidos, only: [:create, :show]
end