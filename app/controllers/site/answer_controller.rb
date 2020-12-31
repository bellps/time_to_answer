class Site::AnswerController < SiteController
    def question
        # @answer = Answer.find(params[:answer_id])

        redis_answer = Rails.cache.read(params[:answer_id]).split("@@")
        @question_id = redis_answer.first
        @correct = ActiveModel::Type::Boolean.new.cast(redis_answer.last)

        unless current_user.blank?
            is_answered = current_user.answered_questions.find_by(question_id: @question_id)

            if is_answered.blank?
                AnsweredQuestion.create!({user: current_user, question_id: @question_id, correct: @correct})
                UserStatistic.set_statistic(@correct, current_user)
            end
        end
    end
end
