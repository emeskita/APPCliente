Rails.application.routes.draw do
  get     '/login',   to: 'logins#login'
  post    '/login',   to: 'logins#create'
  delete  '/logout',  to: 'logins#destroy'
  
  post    '/clientes/buscacep', to: 'clientes#buscacep'

  resources :clientes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
