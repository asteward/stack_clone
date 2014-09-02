class QuestionsController < ApplicationController
  def index
  end

  def new
    @question = Question.new
  end

  def create

  end

  def show
    @question = Question.find(params[:id])
  end
end
