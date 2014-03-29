Blog::Application.routes.draw do
	devise_for :users

	get 'posts/page/:page' => 'posts#index'
	get 'tags/:tag', to: 'posts#tagged', as: :tag
	
	match 'tagged', to: 'posts#tagged', :as => 'tagged', via: 'get' 
	resources :posts

	root to: "welcome#index"
  
  	resources :posts do
  		resources :comments
  	end
end
