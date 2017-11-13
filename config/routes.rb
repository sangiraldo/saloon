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
    
  end

  root 'pages#home'

end
