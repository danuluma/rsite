Rails.application.routes.draw do


  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

  get 'portfolios/angular-items', to: 'portfolios#angular'
  get "portfolio/:id", to: "portfolios#show", as: "portfolio_show"

  get "contact", to: "pages#contact"
  get "about-me", to: "pages#about"

  

  post "versions/:id/revert", to: "versions#revert", as: :revert_version



  resources :blogs do
    member do
      # post "versions/:id/revert", to: "versions#revert", as: "revert_version"
      get '/history', to: 'blogs#history', as: :blogs_history
      post '/:id/undo', to: 'blog#undo', as: :undo
      get :toggle_status
    end
  end


  

  mount ActionCable.server, at: '/cable'

  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
