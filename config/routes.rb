Rails.application.routes.draw do

  get 'transactions/index'
  get 'transactions/show'
  # root to: 'blocks/index', controller: 'blocks', action: 'index'
  root to: 'blocks#index'

  get 'blocks/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
