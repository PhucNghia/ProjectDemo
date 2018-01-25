class CommentsController < ApplicationController
  before_action :load_comment, only: [:show, :edit, :update, :destroy]
  before_action :load_post

  def index
    @comments = Comment.infor_comment.order(id: :asc).page(params[:page]).
      per(Settings.comment_page)
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = current_user.comments.build comment_params

    if @comment.save
      # @comments = Comment.infor_comment.order(id: :asc).page(params[:page]).
      # per(Settings.comment_page)
      respond_to do |format|
        format.html
        format.js
      end
      # redirect_to post_path @comment.post_id
    else
      respond_to do |format|
        format.html
        format.js
      end
      # render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit
    end
  end

  def destroy
    if @comment.destroy
    end
    @comments = Comment.infor_comment.order(id: :asc).page(params[:page]).
      per(Settings.comment_page)
    # redirect_to post_path(@comment.post_id)
  end

  private
    def load_comment
      @comment = Comment.find params[:id]
    end

    def comment_params
      params.require(:comment).permit :post_id, :content
    end

    def load_post
      @post = Post.find_by id: params[:post_id]

    end
end
