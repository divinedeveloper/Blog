Blog::Application.routes.draw do
	devise_for :users

	get 'posts/page/:page' => 'posts#index'
	resources :posts

	root to: "welcome#index"
  
  	resources :posts do
  		resources :comments
  	end
end
