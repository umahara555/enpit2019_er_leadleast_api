Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      get '/hello', to: 'hello#hello'
      get '/board', to: 'board#index'
      get '/handcards', to:'board#card_data'
      post '/handcards', to:'board#new'
      delete '/handcards' , to:'board#delete_data'
    end
  end
end
