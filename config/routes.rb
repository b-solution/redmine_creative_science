# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
resources :project, only: [] do
  resources :billing_hours, except: [:index]
end

