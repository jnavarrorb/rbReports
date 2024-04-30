Rails.application.routes.draw do
 post '/reports', to: 'reports#create'
 get '/reports/new', to: 'reports#new', as: :new_report
 get '/reports', to: 'reports#index'
 get '/reports/:id', to: 'reports#show', as: :report
end
