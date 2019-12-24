Rails.application.routes.draw do

  devise_for :users
  
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
