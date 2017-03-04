# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/

resources :bikes, only: [:index, :new, :create, :edit, :update]

root to: 'bikes#index'
