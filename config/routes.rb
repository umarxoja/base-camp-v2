Rails.application.routes.draw do
  authenticated :user, ->(user) { user.admin? || user.user? } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    end
  resources :projects
  root 'pages#home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts do 
    resources :comments
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
