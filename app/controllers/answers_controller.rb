class AnswersController < ApplicationController
  def new
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash.now.notice = "Successfully saved answer"
      redirect_to question_path(@question)
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

