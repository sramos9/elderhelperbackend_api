Rails.application.routes.draw do
  root 'welcome#index'
  resources :tasks
  resources :elders do
    resources :tasks
  end
  resources :elders do
    collection do
      post '/login', to: 'elders#login'
    end
  end # -------------------------------------------------
  # nesting tasks because it belongs to elder and only an elser can create a task ...
  #  --------------is this right? ----------------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
