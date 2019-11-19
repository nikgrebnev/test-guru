Rails.application.routes.draw do

 # get 'users/new'
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create
# Test delete question /questions/10/destroy via GET method
#  get '/questions/:id/destroy', to: 'questions#destroy'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      #GET /test_passages/101/result
      get :result
    end
  end

end
