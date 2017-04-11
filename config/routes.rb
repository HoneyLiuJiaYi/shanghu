Rails.application.routes.draw do
  get 'category/new'

  post 'category/create'

  match 'show/categories' => 'category#showCategories', :via => [:get, :post]

  get 'login' => 'login#new'

  post 'login/create'

  get  'register' => 'register#new'

  match 'register/create', :via => [:get, :post]

  match 'send/mail' => 'register#sendMail', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
