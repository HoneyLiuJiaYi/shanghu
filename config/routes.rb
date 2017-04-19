Rails.application.routes.draw do
  get 'welcome/index'

  match 'product/new', :via => [:get, :post]

  post 'product/create'

  match '/show/products' => 'product#showAll', :via => [:get, :post]

  match '/show/all/products' => 'product#showAllProducts', :via => [:get, :post]

  match 'delete/product' => 'product#deleteProduct', :via => [:get, :post]

  match 'category/new', :via => [:get, :post]

  post 'category/create'

  match 'delete/category' => 'category#deleteCategory', :via => [:get, :post]

  match 'show/categories' => 'category#showCategories', :via => [:get, :post]

  match 'login' => 'login#new', :via => [:get, :post]

  post 'login/create'

  match 'logout' => 'login#destroy', :via => [:get, :post]

  match  'register' => 'register#new', :via => [:get, :post]

  match 'register/create', :via => [:get, :post]

  match 'send/mail' => 'register#sendMail', :via => [:get, :post]

  match '/product/query' => 'search#findProducts', :via => [:get, :post]

  root :to => 'welcome#index'

  #sprint1 round 2

  match '/region/all' => 'station#getAllRegions', :via => [:get, :post]

  match '/station/create' => 'station#createStation', :via => [:get, :post]

  match '/station/destroy' => 'station#destroyStation', :via => [:get, :post]

  match '/station/all' => 'station#showStation', :via => [:get, :post]

end
