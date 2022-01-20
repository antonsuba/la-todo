Rails.application.routes.draw do
  resources :todos, only: %i[create] do
    resources :tasks do
      member do
        post :reposition
      end
    end
  end
end
