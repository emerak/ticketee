Ticketee::Application.routes.draw do
  get "users/new"
  get "users/create"
  get "users/show"
  root :to => "projects#index"
  resources :projects
end
