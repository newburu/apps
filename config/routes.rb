Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    delete "/users/sign_out" => "devise/sessions#destroy", as: :destroy_user_session
  end

  resource :dashboard, controller: :dashboard, only: [ :show, :update ] do
    resources :projects, only: [ :new, :create, :edit, :update, :destroy ] do
      collection do
        get :get_ogp
      end
    end
  end

  # Public Portfolio Routes
  get "/:slug", to: "portfolios#show", as: :user_portfolio
  get "/:slug/:project_id", to: "portfolios#detail", as: :portfolio_project_detail

  get "up" => "rails/health#show", as: :rails_health_check
end
