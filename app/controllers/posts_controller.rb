class PostsController < ApplicationController
  def index
    @posts = Post.all
    @categories = Category.all
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

  def list
    if params.has_key? :checked_categories
      @posts = []
      categories = []
      checked_categories = params.require(:checked_categories)

      checked_categories.keys.each do |id|
        categories << Category.find(id)
      end

      categories.each do |category|
        category.posts.each do |post|
          @posts << post
        end
      end
    else
      @posts = Post.all
    end

    @posts = @posts.uniq
  end

  def export_csv
    posts = []
    ids = params[:id].split('/')

    ids.each do |id|
      posts << Post.find(id)
    end

    if posts.size == 1
      fn = posts.first.title
    else
      fn = 'postagens'
    end

    respond_to do |format|
      format.html
      format.csv {
        send_data posts.first.to_csv(posts),
        filename: "#{fn}.csv"
      }
    end
  end
end
