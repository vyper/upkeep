# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/

resources :bikes, except: :show do
  resources :parts, except: :show
end

get '/sign-out',                to: 'auth#destroy', as: :sign_out
get '/auth/failure',            to: 'auth#failure'
get '/auth/:provider/callback', to: 'auth#success'

root to: 'bikes#index'
