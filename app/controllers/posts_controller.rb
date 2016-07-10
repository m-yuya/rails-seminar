class PostsController < ApplicationController
  # GET /posts/new
  def new
    @post = Post.new
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
  end
  
end
