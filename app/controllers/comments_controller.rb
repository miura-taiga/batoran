class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = t('comments.comment_success')
      redirect_to board_path(@comment.board)
    else
      flash[:danger] = t('comments.comment_danger')
      @board = Board.find(params[:board_id])
      @comments = @board.comments.includes(:user).order(created_at: :desc) # ここで@commentsをセット
      render 'boards/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :board_id).merge(user_id: current_user.id)
  end
end
