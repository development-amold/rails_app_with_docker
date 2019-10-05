Rails.application.routes.draw do
  resources :coins
  get "hello" => "coins#hello"
  get "coins/:id/edit" => "coins#edit"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
