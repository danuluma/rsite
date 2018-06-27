Rails.application.routes.draw do
  resources :portfolios
 
  get "contact", to: "pages#contact"
  get "about-me", to: "pages#about"

  resources :blogs

  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
