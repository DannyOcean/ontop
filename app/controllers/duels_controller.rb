class DuelsController < ApplicationController
  before_action :find_duel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @duels = Duel.all
  end

  def my_current
    @duels = current_user.duels
    render 'index'
  end

  def new
    @duel = Duel.new
  end

  def show
    @last = @duel.users.last
    @first = @duel.users.first
    @comments = @duel.comments
  end

  def create
    @duel = Duel.new(duel_params)
    if @duel.save
      @duel.update_after_save(current_user)
      redirect_to duels_path
    else
      render 'new'
    end
  end

  def destroy
    @duel.destroy
    redirect_to duels_path
  end

  private
  def find_duel
    @duel = Duel.find(params[:id])
  end

  def duel_params
    params.require(:duel).permit :title, :caller_id, :accepter_id, :accepted,
                                 :winner_id, :looser_id, :deadline
  end
end