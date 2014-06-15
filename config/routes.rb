Rails.application.routes.draw do

  root to: 'duels#index'
  
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/profile/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  resources :duels, except: [:edit, :update] do
    get :my_current, on: :collection
    resources :comments, except: [:index, :edit, :update]
  end
end
