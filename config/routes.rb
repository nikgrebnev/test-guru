Rails.application.routes.draw do

# Test delete question /questions/10/destroy
#  get '/questions/:id/destroy', to: 'questions#destroy'

  resources :tests do
    resources :questions, shallow: true
  end
end
