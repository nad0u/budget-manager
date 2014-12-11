Rails.application.routes.draw do

  resources :budgets

  resources :categories, :except => :show

  resources :users

  root 'welcome#index'
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
  get "account_settings" => "users#account_settings"
  put "account_settings" => "users#update"
  post "/up" => "budgets#update_chart"
  get "/load/:cid" => "budgets#load_chart"
end
