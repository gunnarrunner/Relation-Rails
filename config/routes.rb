Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/discs_manufacturers', to: 'discs_manufacturers#index'
  get '/discs_manufacturers/new', to: 'discs_manufacturers#new'
  post '/discs_manufacturers', to: 'discs_manufacturers#create'
  get '/discs_manufacturers/:id', to: 'discs_manufacturers#show'
  get '/discs', to: 'discs#index'
  get '/discs/new', to: 'discs#new'
  post '/discs', to: 'discs#create'
  get '/discs/:id', to: 'discs#show'
  get '/discs_manufacturers/:discs_manufacturer_id/new', to: 'discs#new'
  post '/discs_manufacturers/:discs_manufacturer_id/discs', to: 'discs#create'

  get '/discs_manufacturers/:discs_manufacturer_id/discs', to: 'discs_manufacturers#discs'
  get '/discs_manufacturers/:id/edit', to: 'discs_manufacturers#edit'
  patch '/discs_manufacturers/:id', to: 'discs_manufacturers#update'
  delete '/discs_manufacturers/:id', to: 'discs_manufacturers#destroy'
  get '/discs/:id/edit', to: 'discs#edit'
  patch '/discs/:id', to: 'discs#update'
  delete '/discs/:id', to: 'discs#destroy'


  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'

  get '/players', to: 'players#index'

end
