Rails.application.routes.draw do
  resources :planets, :scientists, :missions

  get '/about', to: 'about#index'
end
