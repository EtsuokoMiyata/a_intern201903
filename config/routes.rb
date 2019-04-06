Rails.application.routes.draw do
 root 'static_pages#home'
 get '/signup', to: 'users#new'
 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy' 
 
 get '/edit-basic-info/:id', to: 'users#edit_basic_info', as: :basic_info
 patch "update-basic-info", to: "users#update_basic_info"
 get 'users/:id/attendances/:date/edit', to: 'attendances#edit', as: :edit_attendances
 patch 'users/:id/attendances/:date/update', to: 'attendances#update', as: :update_attendances
  
 resources :users do
  resources :attendances, only: :create
 end

 #post '/users/:user_id/overtimes', to: 'overtimes#create', as: :overtime
 #残業申請モーダル用
 #patch '/users/:id/attendances/:date/overtime_edit', to: 'attendances#overtime_edit', as: :edit_overtimes
 patch '/users/:id/overtime_edit', to: 'attendances#overtime_edit', as: :edit_overtimes
end
