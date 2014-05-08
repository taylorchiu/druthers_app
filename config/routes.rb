Druthers::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'home#index'

  
  get '/books/search', to: 'books#search', as: 'books_search'
  get '/books/results', to: 'books#results', as: 'books_results'
  get '/books/details/:id', to: 'books#details', as: 'books_details'
  post 'books/details/:id', to: 'books#create', as: 'save_book'
  get '/books', to: 'books#index', as: 'books'

  get 'books/new', to: 'books#new', as: 'new_book'
  delete 'books/:id', to: 'books#destroy', as: 'delete_book'


  resources :users, except: [:index, :show]
  resources :polls
  resources :guests, only: [:new, :create]

  get '/signup', to: 'users#new'
  delete '/signout', to: 'sessions#destroy'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  get '/polls/link/:link', to: 'polls#link', as: 'link'

  get '/error', to: 'home#error', as: 'error'
end

#        Prefix Verb   URI Pattern                  Controller#Action
#          root GET    /                            home#index
#  books_search GET    /books/search(.:format)      books#search
# books_results GET    /books/results(.:format)     books#results
# books_details GET    /books/details/:id(.:format) books#details
#         books GET    /books(.:format)             books#index
#      new_book GET    /books/new(.:format)         books#new
#     save_book POST   /books/details/:id(.:format) books#create
#   delete_book DELETE /books/:id(.:format)         books#destroy
#         users POST   /users(.:format)             users#create
#      new_user GET    /users/new(.:format)         users#new
#     edit_user GET    /users/:id/edit(.:format)    users#edit
#          user PATCH  /users/:id(.:format)         users#update
#               PUT    /users/:id(.:format)         users#update
#               DELETE /users/:id(.:format)         users#destroy
#         polls GET    /polls(.:format)             polls#index
#               POST   /polls(.:format)             polls#create
#      new_poll GET    /polls/new(.:format)         polls#new
#     edit_poll GET    /polls/:id/edit(.:format)    polls#edit
#          poll GET    /polls/:id(.:format)         polls#show
#               PATCH  /polls/:id(.:format)         polls#update
#               PUT    /polls/:id(.:format)         polls#update
#               DELETE /polls/:id(.:format)         polls#destroy
#        guests POST   /guests(.:format)            guests#create
#     new_guest GET    /guests/new(.:format)        guests#new
#        signup GET    /signup(.:format)            users#new
#       signout DELETE /signout(.:format)           sessions#destroy
#        signin GET    /signin(.:format)            sessions#new
#               POST   /signin(.:format)            sessions#create






