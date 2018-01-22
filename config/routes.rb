Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
     namespace :v1 do
       resources :registerations, :only => [:create]
       resources :sessions, :only => [:create, :destroy]
       resources :profiles, :only => [:create, :update] do
         collection do
           patch :update_img
           patch :set_online
           patch :set_offline
         end
       end
     end
  end
end
