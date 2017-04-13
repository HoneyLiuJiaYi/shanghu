Rails.application.routes.draw do
  get 'welcome/index'

  match 'product/new', :via => [:get, :post]

  post 'product/create'

  match 'show/products' => 'product#showAll', :via => [:get, :post]

  match 'delete/product' => 'product#deleteProduct', :via => [:get, :post]

  match 'category/new', :via => [:get, :post]

  post 'category/create'

  match 'delete/category' => 'category#deleteCategory', :via => [:get, :post]

  match 'show/categories' => 'category#showCategories', :via => [:get, :post]

  match 'login' => 'login#new', :via => [:get, :post]

  post 'login/create'

  match  'register' => 'register#new', :via => [:get, :post]

  match 'register/create', :via => [:get, :post]

  match 'send/mail' => 'register#sendMail', :via => [:get, :post]

  root :to => 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
