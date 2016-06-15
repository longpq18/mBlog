class PostsController < ApplicationController
  #layout 'posts'
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_action :current_user, only: [:new, :create, :update]

  def index
    @categories = Category.all
    if params[:category].blank?
      @posts = Post.all.order('created_at DESC').limit(6)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where( :category_id => @category_id ).order('created_at DESC').limit()
    end 
    
  end

  def tag
    if params[:tag]
        @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 10)
    end   
  end

  def show
  end

  def new
    @post = current_user.posts.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @post = current_user.posts.build( post_params )
    @post.category_id = params[:category_id]

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
    @post.category_id = params[:category_id]
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
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

    def post_params
      params.require(:post).permit(:user_id, :name, :content, :status, :category_id, :picture, :tag_list)
    end
end
