class VotesController < ApplicationController
  def new
    @vote = current_user.votes.new
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @vote = @answer.votes.new(user_id: current_user.id)
    if !@vote.save
      flash[:alert] = "Hey, You! You can only upvote an answer once!"
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
