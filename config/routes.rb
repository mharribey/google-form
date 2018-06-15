Rails.application.routes.draw do
  devise_for :users
  resources :forms

  post 'match' => 'forms#match', as: :form_match
  get 'note' => 'forms#note', as: :form_note

  root 'forms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
