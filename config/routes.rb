Rails.application.routes.draw do
  namespace :v1 do
    resource :sessions, only: [:create, :destroy]
  end

  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
