# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/

resources :bikes, except: :show do
  resources :parts, except: :show
end

root to: 'bikes#index'
