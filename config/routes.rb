Rails.application.routes.draw do
  namespace :admins do
    get 'brands/index'
    get 'brands/new'
    get 'brands/create'
    get 'brands/edit'
    get 'brands/update'
    get 'brands/change_status'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_scope :user do
       root 'users/sessions#new'
  end
   namespace :admins do
         get '/', to:'managers#home'
         resource :brands
   end
end
