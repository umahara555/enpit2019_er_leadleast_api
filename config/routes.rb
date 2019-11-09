Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      get '/hello', to: 'hello#hello'
      get '/board', to: 'board#index'
      get '/boardcards', to:'board#card_data'
      post '/boardcards', to:'board#new'
      delete '/boardcards' , to:'board#delete_data'
    end
  end
end
