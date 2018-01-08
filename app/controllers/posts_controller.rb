class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new params.require(:post).permit(:title, :content)

    if @post.save
      redirect_to root_url
    else
      render :new
    end
  end
end
