class VotesController < ApplicationController

  def index
    @answer = Answer.find(params[:answer_id])
    @question = Question.find(@answer.question.id)
    @answers = @question.answers
    respond_with @answers
  end

  def new
    @vote = current_user.votes.new
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @question = Question.find(@answer.question_id)
    @vote = @answer.votes.new(user_id: current_user.id)
    flash[:alert] = "Hey, You! You can only upvote an answer once!" if !@vote.save
    # @answers = @question.answers
    # respond_with @answer
    respond_to do |format|
      format.html(render '/questions/show')
      format.js
    end
  end

  def show

    redirect_to :back
  end
end
