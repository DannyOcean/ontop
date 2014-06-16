class VotesController < ApplicationController
  def create
    duel = Duel.find(params[:duel_id])
    @vote = duel.votes.build(vote_params)
    if @vote.save
      @vote.update_after_save(current_user)
      redirect_to duel_path(duel)
    end
  end

  private
  def vote_params
    params.require(:vote).permit :user_id, :duel_id
  end
end
