Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'pages#dashboard', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :users do
    resources :customers
    resources :invoices
    resources :parts
  end

end
