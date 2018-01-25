class CommentsController < ApplicationController
  before_action :load_comment, only: [:show, :edit, :update, :destroy]

  def index
    # @comments = Comment.all
    @q = Post.ransack params[:q]
    @comments = @q.result(distinct: true).order(id: :asc).page(params[:page])
      .per Settings.perhomepage
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new comment_params

    if @comment.save
      redirect_to post_path @comment.post_id
    else
      render :new
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
    @comment.destroy
    redirect_to post_path(@comment.post_id)
  end

  private
    def load_comment
      @comment = Comment.find params[:id]
    end

    def comment_params
      params.require(:comment).permit :user_id, :post_id, :comment
    end
end
