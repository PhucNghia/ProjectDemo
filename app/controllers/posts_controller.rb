class PostsController < ApplicationController
  before_action :load_post, only: [:show, :edit, :update, :destroy]
  # before_action :join_user_post, only: [:index, :show]

  def index
    @posts = Post.infor_post.order(id: :asc).page(params[:page]).
      per(Settings.perpage)
  end

  def show
    @comments = @post.comments.infor_comment.order(id: :asc)
      .page(params[:page]).per(Settings.comment_page)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
  def load_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :picture)
  end

  def join_user_post
    @join_user_post = Comment.joins(:user, :post)
  end
end
