class BoardsController < ApplicationController
  before_action :require_login, only: %i[index new create]

  def index
    @boards = Board.includes(:user).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      flash[:success] = t('flash.boards.success', item: Board.model_name.human)
      redirect_to boards_path
    else
      flash[:danger] = t('flash.boards.danger', item: Board.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @store_name = @board.store_name
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end

  private

  def board_params
    params.require(:board).permit(:store_name, :product_name, :jan_code, :expiration_date)
  end
end