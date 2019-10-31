Rails.application.routes.draw do
  get '/questions/:id/destroy', to: 'questions#destroy'
  resources :tests do
    resources :questions, shallow: true
  end
end
