Rails.application.routes.draw do

  resource :sessions, only: %i(new create destroy)

  resource :users, only: %i(new create destroy)

  root 'pictures#index'
  get 'pictures' => 'pictures#index'

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  get 'pictures/:id/edit' => 'pictures#edit'
  patch 'pictures/:id' => 'pictures#update'

  delete 'pictures/:id' => 'pictures#destroy'

  get 'pictures/:id' => 'pictures#show'

end
