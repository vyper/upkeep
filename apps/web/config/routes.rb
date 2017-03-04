# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/

resources :bikes, except: :show

root to: 'bikes#index'
