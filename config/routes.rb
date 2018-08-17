Rails.application.routes.draw do

  resources :suggestion, only: %i[new create]

  get 'users/new'

  get 'users/create'

  root 'pictures#index'
  get 'pictures' => 'pictures#index'

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  get 'pictures/:id/edit' => 'pictures#edit'
  patch 'pictures/:id' => 'pictures#update'

  delete 'pictures/:id' => 'pictures#destroy'

  get 'pictures/:id' => 'pictures#show'

end
