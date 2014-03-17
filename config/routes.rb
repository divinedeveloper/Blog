Blog::Application.routes.draw do

	resources :posts

	root to: "welcome#index"
  
  	resources :posts do
  		resources :comments
  	end
end
