class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :tag_cloud

  def index
    if params[:tag].present? 
      @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 4)
    else
      @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 4)
    end
  end

  def tag_cloud
    @tags = Post.tag_counts_on(:tags, :limit => 3, :order => "count desc")
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Article succesfully saved!"
    else
      render 'new', notice: "Try Again. I was unable to save your post."
    end
  end

  def edit
  end

  def update

    if @post.update(params[:post].permit(:title, :body, :image, :tag_list))
      redirect_to @post, notice: "Article succesfully edited!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :image, :image_url, :slug, :tag_list)
    end

    def find_post
      @post = Post.friendly.find(params[:id])
    end

end