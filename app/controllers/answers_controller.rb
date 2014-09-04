class AnswersController < ApplicationController
  before_filter :authorize
  respond_to :html, :json

  def index
    # @question = Question.find(params[:question_id])
    # @answers = @question.answers
    @answers = Answer.all
    respond_with @answers
  end

  def show
    redirect_to :back
  end

  def new
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash.now.notice = "Successfully saved answer"
      respond_to do |format|
        format.html { redirect_to new_question_answer_path(@question) }
        format.js
      end
    else
      flash.now.alert = "Incomplete!!!!!!!!!!"
      render 'new'
    end
  end

private

def answer_params
  params.require(:answer).permit(:text, :user_id)
end

end

