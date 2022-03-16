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
   resources :addresses, only: [:index, :create, :edit, :update]
   resources :cart_items, only: [:index, :show]
   resources :items, only: [:index, :show]
   resources :orders, only: [:index, :show, :new, :confirm, :create, :thanks]
   resources :customers, only: [:show, :quit, :out, :edit, :update]
   end

   
end
