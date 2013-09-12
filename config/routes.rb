Ticketee::Application.routes.draw do
  get "users/new"
  get "users/create"
  get "users/show"
  root :to => "projects#index"
  resources :projects do
    resources :tickets
  end
  resources :tickets do
    resources :comments 
    resources :tags do
      member do
        delete :remove
      end 
    end
  end
end
