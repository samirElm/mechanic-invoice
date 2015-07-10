Rails.application.routes.draw do
  devise_for :users

  namespace :users do
    resources :customers
    resources :invoices
  end

  resources :parts

end
