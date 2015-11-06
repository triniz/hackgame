Rails.application.routes.draw do
  
 root 'players#index'
# root 'messaging#index'
# root to: 'flags#test'
# get  'user_stream' => 'flags#index_stream'
# get 'test' => 'messaging#send_message'
# get 'reception'

 
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'flag' => 'flags#new'    
  post 'flag' => 'flags#create'
    
  resources :players  
    
  get 'signup'  => 'players#new'
#  get 'stream' => 'players#stream'
        
end
 