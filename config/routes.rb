Rails.application.routes.draw do
  root "entries#index"

  devise_for :users

  authenticate :user, -> (user) { user.admin? } do
    mount Motor::Admin => '/admin'
  end

  resources :entries do
    member do
      post 'upvote', to: 'votes#upvote'
    end
    resources :comments
  end

  resources :tags

  get 'random', to: 'entries#random'

  get "up" => "rails/health#show", as: :rails_health_check
end
