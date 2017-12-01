Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks",
                                    registrations: "users/registrations" }


  namespace :admin do
    root to: "dashboards#index"

    resources :users,    only: [:index, :destroy] do
      collection do
        match 'search' => 'users#search', via: [:get, :post], as: :search
      end
    end

    resources :establishments,    only: [:index, :destroy] do
      collection do
        match 'search' => 'establishments#search', via: [:get, :post], as: :search
      end
    end

    resources :services

  end

  root 'pages#home'
  resources :establishments
  get "/user_establishments", to: "establishments#user_establishment"
  get "establishments/services/:tag", to: "establishments#index", as: :tag_establishments
  get "services_establishment", to: "establishments#services", as: :services_establishment

end
