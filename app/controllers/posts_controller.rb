class PostsController < ApplicationController
  # GET /posts/new
  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    post_params = params.require(:post).permit(:category_id, :title, :body)
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    post_params = params.require(:post).permit(:category_id, :title, :body)
    if @post.update(post_params)
      redirect_to @post, notice: 'Post wasy successfully update.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_url, notice: 'Post wasy successfully destroyed.'    
  end

end
