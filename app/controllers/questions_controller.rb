class QuestionsController < ApplicationController
  
  def create
    question = Question.create(question_params)

    redirect_to question_path(question)
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)

    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])

  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

end
