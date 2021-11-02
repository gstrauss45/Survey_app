class QuestionsController < ApplicationController
    def create
        @question = Question.new(new_question_params)
        if params[:question][:other] == "1"
          @question.possible_answers.append('other')
        end
        @survey = Survey.find(params[:question][:survey_id])
        @question.save
        redirect_to @survey
    end

    def show
        @question = Question.find(params[:id])
    end

    def update
      if(params[:question][:possible_answers])
        @question = Question.find(params[:question][:question_id])
        @survey = Survey.find(params[:question][:survey_id])
        if @question.possible_answers.append(params[:question][:possible_answers])
          @question.save
          redirect_to @survey
        else
          render :edit
        end
      else
        @question = Question.find(params[:id])
        @survey = Survey.find(params[:question][:survey_id])
        if @question.update(new_question_params)
          redirect_to @survey
        else
          render :edit
        end
      end
    end

    def destroy
        @question = Question.find(params[:question_id])
        @question.destroy
        @survey = Survey.find(params[:id])
        redirect_to @survey
    end

    def edit
        @question = Question.find(params[:question_id])
        @survey = Survey.find(params[:survey_id])
    end

    def possible_answers
      @question = Question.find(params[:question_id])
      @survey = Survey.find(params[:survey_id])
    end

    private
    def new_question_params
      params.require(:question).permit(:question, :survey_id, :custom_responses)
    end

    def possible_question_params
      params.require(:question).permit(:possible_answers)
    end

    def other_params
      params.require(:question).permit(:other)
    end
end
