Rails.application.routes.draw do
  get 'articles/new', to: 'articles#new'
  get 'welcome/index', to: 'welcome#index'
  get 'about', to: 'welcome#about'

  get 'signup', to: 'users#new'
  #post 'users', to: 'users#create'  #adds the route for user signup page
  resources :users, except: [:new] #add all restful routes for user objects except the new route defined above

  resources :articles, except: [:new] 

  resources :articles do
    resources :comments
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy] #add all restful routes for category objects except the destroy route to be defined later 

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
