Rails.application.routes.draw do
  root 'pins#index'
  devise_for :users
  resources :users
  get 'tags/:tag' => 'pins#index', as: :tag
  resources :pins do
    member do
      put "like" => "pins#upvote"
    end
    resources :comments, only: [:create]
  end
end
