Ticketee::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects, defaults: { format: :json }
    end
  end
  
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
