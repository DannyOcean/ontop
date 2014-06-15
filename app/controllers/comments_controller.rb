class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy]
  before_action :find_duel, only: [:new, :create, :destroy]

  def new
    @comment = @duel.comments.build
  end
  
  def create
    @comment = @duel.comments.build(duel_params)
    if @comment.save
      @comment.update_after_save(current_user)
      redirect_to @duel
    else
      render 'new'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @duel
  end

  private
  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_duel
    @duel = Duel.find(params[:duel_id])
  end

  def duel_params
    params.require(:comment).permit :title, :body, :user_id
  end  
end