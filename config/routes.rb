Rails.application.routes.draw do


   devise_for :customers,skip: [:passwords], controllers: { registrations: "public/registrations", sessions: 'public/sessions' }
   devise_for :admin, skip: [:registrations, :passwords] ,controllers: { sessions: "admin/sessions" }

   root to: 'public/homes#top'
   get '/about' => 'public/homes#about'

   namespace :admin do
   resources :genres, only: [:index, :edit, :create, :update]
   resources :order_details, only: [:update]
   resources :items, only: [:new, :index, :show, :create, :edit, :update, :destroy]
   resources :orders, only: [:index, :show, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   end


   namespace :public do
   resources :genres, only: [:index]
   resources :addresses, only: [:index, :create, :edit, :update, :destroy]
   resources :cart_items, only: [:index, :show, :destroy, :edit, :create, :update]
   delete '/cart_items/all_destroy' => 'cart_items#all_destroy'
   resources :items, only: [:index, :show]
   resources :orders, only: [:index, :show, :new, :confirm, :create, :thanks]
   post '/confirm' => 'orders#confirm'

   get '/thanks' => 'orders#thanks'
   resources :order_details, only: [:index, :show, :create]
  resource :customers, only: [:show, :quit, :out, :edit, :update]
   get '/quit' => 'customers#quit', as: 'quit'
   patch '/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
   end


end
