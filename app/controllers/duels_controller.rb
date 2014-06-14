class DuelsController < ApplicationController
  before_action :find_duel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @duels = Duel.all
  end

  def new
    @duel = Duel.new
  end

  def show; end

  def create
    @duel = Duel.new(duel_params)
    @duel.caller_id = current_user.id
    if @duel.save
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