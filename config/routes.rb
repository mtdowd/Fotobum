Rails.application.routes.draw do
  root to: "galleries#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  resources :galleries do
    resources :images
  end

  resources :images, only: [] do
    resources :comments, only: [:create]
  end

  resources :groups, only: [:destroy, :index, :new, :create, :show, :edit, :update] do
    member do
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
    end
  end
end
