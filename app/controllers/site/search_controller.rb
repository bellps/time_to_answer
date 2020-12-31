class Site::SearchController < SiteController
    before_action :get_answered_questions

    def questions
        @questions = Question.search(params[:search][:search], page: params[:page], per_page: 5, includes: [:answers, :subject])
    end

    def subject
        @questions = Question.search_subject(params[:subject_id], params[:page])
    end

    def get_answered_questions
        @answered = AnsweredQuestion.where(user: current_user)
    end
end
