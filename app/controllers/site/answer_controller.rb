class Site::AnswerController < SiteController
    def question
        @answer = Answer.find(params[:answer_id])

        unless current_user.blank?
            is_answered = current_user.answered_questions.find_by(question_id: @answer.question_id)

            if is_answered.blank?
                AnsweredQuestion.create!({user: current_user, question_id: @answer.question_id, correct: @answer.correct})
                UserStatistic.set_statistic(@answer, current_user)
            end
        end
    end
end
