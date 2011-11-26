Jsular::Application.routes.draw do

  resources :expressions, :only => [:index, :show, :create]
  match '/:id' => 'expressions#show', :as => :permalink

  root :to => 'expressions#index'

end
