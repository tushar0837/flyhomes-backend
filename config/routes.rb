Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}, path: '/auth'


  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :surveys
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
