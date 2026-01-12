Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resource :dashboard, controller: :dashboard, only: [ :show, :update ] do
    resources :projects, only: [ :new, :create, :edit, :update, :destroy ]
  end

  # Public Portfolio Routes
  get "/:slug", to: "portfolios#show", as: :user_portfolio
  get "/:slug/:project_id", to: "portfolios#detail", as: :portfolio_project_detail

  get "up" => "rails/health#show", as: :rails_health_check
end
