Rails.application.routes.draw do

  resources :categories
  resources :subcategories

  resources :articles do
    resources :comments
  end

  get 'shopping/carts'

  resources :attachments, only: [:create, :destroy, :new, :show]


  resources :products
  resources :in_shopping_carts, only: [:create, :destroy]
  get 'email/create'

  devise_for :users

  post "/emails/create", as: :create_email

  post "/pagar", to: "payments#create"

  post "/payments/cards", to:"payments#process_card"

  get "/carrito", to: "shopping_carts#show"

  get "/ad/:product_id",as: :add_to_cart, to: "in_shopping_carts#create"

  get "/checkout", to: "payments#checkout"

  get "/ok", to: "welcome#payment_succed"

  get "/dashboard", to:"welcome#dashboard"

  put "/articles/:id/publish", to: "articles#publish"

  authenticated :user do

   root  'welcome#index'
 end

   unauthenticated :user do
     devise_scope :user do
     root  'welcome#unregistered', as: :unregistered_root
   end
 end

end
