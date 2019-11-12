Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      get '/hello', to: 'hello#hello'
      get '/board', to: 'board#index'

      get '/boardcards', to:'board#card_data'
      post '/boardcards', to:'board#new'
      delete '/boardcards', to:'board#delete_data'

      get '/products', to:'products#index'
      post '/products', to:'products#create'

      get '/leancanvas', to:'leancanvas#index'
      get '/leancanvas/:product_id', to: 'leancanvas#show'
      post '/leancanvas/:product_id', to:'leancanvas#create'
      patch '/leancanvas/:product_id', to:'leancanvas#update'

      get '/elevator_pitch', to:'elevator_pitch#index'
      get '/elevator_pitch/:product_id', to: 'elevator_pitch#show'
      post '/elevator_pitch/:product_id', to:'elevator_pitch#create'
      patch '/elevator_pitch/:product_id', to:'elevator_pitch#update'

      get '/user_story_map', to:'user_story_map#index'
      get '/user_story_map/:product_id', to: 'user_story_map#show'
      post '/user_story_map/:product_id', to:'user_story_map#create'
      patch '/user_story_map/:product_id', to:'user_story_map#update'

      get '/product_backlog', to:'product_backlog#index'
      get '/product_backlog/:product_id', to: 'product_backlog#show'
      post '/product_backlog/:product_id', to:'product_backlog#create'
      patch '/product_backlog/:product_id', to:'product_backlog#update'
    end
  end
end
