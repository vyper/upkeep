# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/

resources :bikes, only: [:index]

root to: 'bikes#index'
