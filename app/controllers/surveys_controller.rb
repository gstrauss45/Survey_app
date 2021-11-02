class SurveysController < ApplicationController
    def new
        @survey = Survey.new
    end

    def create
        @survey = Survey.new(survey_params)
        if @survey.save
          redirect_to @survey
        else
          render :new
        end
    end

    def show
        @survey = Survey.find(params[:id])
        @new_question = Question.new
        @metrics = Array.new
        @total_metrics = Array.new
        @survey.questions.each do |question|
          question.possible_answers.each do |possible_answer|
            @metrics.append(Answer.where(answer: possible_answer).where(question_id: question.id).count)
          end
          @total_metrics.append(Answer.where(question_id: question.id).count)
        end
    end

    def update
        @survey = Survey.find(params[:id])
        if @survey.update(survey_params)
          redirect_to @survey
        else
          render :edit
        end
    end

    def destroy
        @survey = Survey.find(params[:id])
        @survey.destroy
        redirect_to root_path
    end

    def edit
        @survey = Survey.find(params[:id])
    end

    private
    def survey_params
      params.require(:survey).permit(:title)
    end
end
