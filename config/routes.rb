Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :customers
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'items/new'
    get 'items/index'
    get 'items/show'
    get 'items/create'
    get 'items/edit'
    get 'items/update'
    get 'items/destroy'
  end
  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/create'
    get 'orders/update'
  end
  namespace :public do
    get 'adresses/index'
    get 'adresses/create'
    get 'adresses/edit'
    get 'adresses/update'
    get 'adresses/destroy'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/create'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/all_destroy'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/quit'
    get 'customers/out'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :public do
    get 'genres/index'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/create'
    get 'orders/thanks'
    get 'orders/index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# devise_for :customers,skip: [:passwords], controllers: {
#   registrations: 'public/registrations',
#   sessions: 'public/sessions'
# }

# devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
#   sessions: "admin/sessions"
# }
end
