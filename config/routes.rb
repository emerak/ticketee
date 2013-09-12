Ticketee::Application.routes.draw do
  root :to => "projects#index"
  resources :users
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
