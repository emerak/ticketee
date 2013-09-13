Ticketee::Application.routes.draw do
  root :to => "projects#index"
  resources :users
  resources :projects do
    resources :tickets do
      collection do
        get :search
      end
    end
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
