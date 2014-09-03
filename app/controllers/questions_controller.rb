class QuestionsController < ApplicationController
  def index
  end

  def new
    @question = Question.new
  end

  def create
    @user = current_user
    @question = @user.questions.new(question_params)
    if @question.save
      flash[:notice] = "<strong>Hey!</strong> Your question has been added!"
      redirect_to questions_path
    else
      flash[:alert] = "Please fill in the text box"
      redirect_to new_question_path
    end
  end

  def show
    @user = current_user
    @question = Question.find(params[:id])

  end

private
  def question_params
    params.require(:question).permit(:text)
  end
end
