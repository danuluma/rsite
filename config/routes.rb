Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get "portfolio/:id", to: "portfolios#show", as: "portfolio_show"
 
  get "contact", to: "pages#contact"
  get "about-me", to: "pages#about"

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
