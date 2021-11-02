class AnswersController < ApplicationController
    def new
      @survey = Survey.find(params[:param1])
      @answer = Answer.new
      @count = params[:count].to_i
      if @survey.questions[@count]
        render new_answer_path
      else
        redirect_to new_answer_path
      end
    end

    def create
      @survey = Survey.find(params[:answer][:survey_id])
      @answer = Answer.new(new_answer_params)
      @answer.save
      @count = params[:answer][:count].to_i + 1 || 0
      if @survey.questions.count > @count
        redirect_to new_answer_path count: @count, param1: params[:answer][:survey_id]
      else
        redirect_to root_path
      end
    end

    def show
        @answer = Answer.find(params[:id])
    end

    def update
        @answer = Answer.find(params[:id])
        if @answer.update(answer_params)
          redirect_to @answer
        else
          render :edit
        end
    end

    def destroy
        @answer = Answer.find(params[:id])
        @answer.destroy
        redirect_to root_path
    end

    def edit
        @answer = Answer.find(params[:id])
    end

    private
    def new_answer_params
      params.require(:answer).permit(:answer, :question_id)
    end

    def full_answer_params
      params.require(:answer).permit(:answer, :survey_id, :survey, :count, :survey_id)
    end
end
