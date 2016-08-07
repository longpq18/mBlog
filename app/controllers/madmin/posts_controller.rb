class Madmin::PostsController < Madmin::AdminController
   	#before_action :set_post, only: [:show, :destroy]
   	#respond_to :html, :js

  	def index
  		@cat = Category.all

      	if params[:category_id]
      		@posts = Post.joins(:category).where(categories: {id: params[:category_id]}).paginate(:page => params[:page], :per_page => 2)
      	else
         	@posts = Post.all.paginate(:page => params[:page], :per_page => 10)
      	end

      	respond_to do |format|
	      format.html { render 'details', :layout => false if request.xhr? }
	      format.js { render 'index' } #index.js.erb
	      format.json { render json: @posts }
	    end
    end

    def update_text
	    @city_text = params[:name]
	end
  
	def show
		@post = Post.find(params[:id])
	end

  	def destroy
  		@post = Post.find(params[:id])
	    @post.destroy
	    respond_to do |format|
	      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
	      format.json { head :no_content }
	    end
  	end

  	private
	    def set_post
	      @post = Post.find(params[:id])
	    end

	    # def post_params
	    #   params.require(:post).permit(:user_id, :name, :content, :status, :category_id, :picture, :tag_list)
	    # end
end
