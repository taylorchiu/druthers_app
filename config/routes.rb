Druthers::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'home#index'

  get '/polls/search', to: 'polls#search'
  get '/polls/results', to: 'polls#results'
  get '/polls/details/:id', to: 'polls#details', as: "polls_details"

  resources :users, except: [:index, :show]
  resources :polls
  resources :guests, only: [:new, :create]

  get '/signup', to: 'users#new'
  delete '/signout', to: 'sessions#destroy'
  get '/signin', to: 'sessions#new'
 
end

#   Prefix Verb   URI Pattern               Controller#Action
#          root GET    /                         home#index
#  polls_search GET    /polls/search(.:format)   polls#search
# polls_results GET    /polls/results(.:format)  polls#results
# polls_details GET    /polls/details(.:format)  polls#details
#         users POST   /users(.:format)          users#create
#      new_user GET    /users/new(.:format)      users#new
#     edit_user GET    /users/:id/edit(.:format) users#edit
#          user PATCH  /users/:id(.:format)      users#update
#               PUT    /users/:id(.:format)      users#update
#               DELETE /users/:id(.:format)      users#destroy
#         polls GET    /polls(.:format)          polls#index
#               POST   /polls(.:format)          polls#create
#      new_poll GET    /polls/new(.:format)      polls#new
#     edit_poll GET    /polls/:id/edit(.:format) polls#edit
#          poll GET    /polls/:id(.:format)      polls#show
#               PATCH  /polls/:id(.:format)      polls#update
#               PUT    /polls/:id(.:format)      polls#update
#               DELETE /polls/:id(.:format)      polls#destroy
#        guests POST   /guests(.:format)         guests#create
#     new_guest GET    /guests/new(.:format)     guests#new
#        signup GET    /signup(.:format)         users#new
#       signout DELETE /signout(.:format)        sessions#destroy
#        signin GET    /signin(.:format)         sessions#new






