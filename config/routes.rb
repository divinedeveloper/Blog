Blog::Application.routes.draw do

  devise_for :users
	resources :posts

	root to: "welcome#index"
  
  	resources :posts do
  		resources :comments
  	end
end
