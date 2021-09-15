Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :create
      resources :subscriptions, only: [:create, :update]

      namespace :users do
        get '/:id/subscriptions', to: 'user_subscriptions#index'
      end
    end
  end
end
