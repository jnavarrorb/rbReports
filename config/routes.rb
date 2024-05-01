Rails.application.routes.draw do
    delete '/reports/:id', to: 'reports#destroy'
    patch '/reports/:id', to: 'reports#update'
    post '/reports', to: 'reports#create'
    get '/reports/new', to: 'reports#new', as: :new_report
    get '/reports', to: 'reports#index'
    get '/reports/:id', to: 'reports#show', as: :report
    get '/reports/:id/edit', to: 'reports#edit', as: :edit_report
end
