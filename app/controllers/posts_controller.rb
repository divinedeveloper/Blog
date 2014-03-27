class PostsController < ApplicationController
  before_filter :authorize_blogger!, :except => [:index, :show]
  rescue_from Pundit::NotAuthorizedError, :with => :record_not_found

	def new
  		@post = Post.new
	end

	def create
  		@post = Post.new(params[:post].permit(:title, :text))
      authorize @post
  	 	if @post.save
    		redirect_to @post
  		else
    		render 'new'
  		end
	end

	def show
  		@post = Post.find(params[:id])
  end	

	def index
  		@posts = Post
              .paginate(:page => params[:page], :per_page => 10)
              .order('created_at DESC')
	end

	def edit
  		@post = Post.find(params[:id])
      authorize @post
	end

	def update
  		@post = Post.find(params[:id])
      authorize @post 
  		if @post.update(params[:post].permit(:title, :text))
    		redirect_to @post
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@post = Post.find(params[:id])
      authorize @post
  		@post.destroy
 	    redirect_to posts_path
	end

	private
    def post_params
    	params.require(:post).permit(:title, :text)
  	end

    def record_not_found
      redirect_to posts_path, :alert => "You are not authorized to do that"
    end
end
