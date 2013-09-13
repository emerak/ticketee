Ticketee::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects
    end
  end
  
  namespace :api do
    namespace :v1 do
      resources :projects
    end
  end
  
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
