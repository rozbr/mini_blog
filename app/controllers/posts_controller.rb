class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    success = false

    @post = Post.new params.require(:post).permit(:title, :content)

    if params.has_key? :checked_categories
      checked_categories = params.require(:checked_categories)

      checked_categories.keys.each do |id|
        @post.categories << Category.find(id)
      end

      success = @post.save
    end

    @categories = Category.all

    success ? redirect_to(root_url) : render(:new)
  end

  def show
    @post = Post.find(params[:id])
  end
end
