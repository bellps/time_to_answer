class UsersBackoffice::WelcomeController < UsersBackofficeController 
    def index
        @questions = Question.includes(:answers, :subject)
        @user_statistic = UserStatistic.find_or_create_by(user: current_user)
        @answered_questions = []

        current_user.answered_questions.each do |answered|
            @questions.each do |question|
                if question.id == answered.question_id
                    @answered_questions.push({question: question, correct: answered.correct})
                end
            end
        end
    end
end
