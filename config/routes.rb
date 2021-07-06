Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/discs_manufacturers', to: 'discs_manufacturers#index'
  get '/discs_manufacturers/:id', to: 'discs_manufacturers#show'
  get '/discs', to: 'discs#index'
  get '/discs/:id', to: 'discs#show'
  get 'discs_manufacturers/:id/discs', to: 'discs_manufacturers_discs#index'

end
