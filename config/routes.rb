Rails.application.routes.draw do


  get 'shopping/carts'

  resources :attachments, only: [:create, :destroy, :new, :show]


  resources :products
  resources :in_shopping_carts, only: [:create, :destroy]
  get 'email/create'

  devise_for :users

  post "/emails/create", as: :create_email

  post "/pagar", to: "payments#create"

  get "/carrito", to: "shopping_carts#show"

  get "/ad/:product_id",as: :add_to_cart, to: "in_shopping_carts#create"

  get "/checkout", to: "payments#checkout"

  get "/ok", to: "welcome#payment_succed"


  authenticated :user do

   root  'welcome#index'
 end

   unauthenticated :user do
     devise_scope :user do
     root  'welcome#unregistered', as: :unregistered_root
   end
 end

end
