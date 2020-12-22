class Site::WelcomeController < SiteController
  def index
    @questions = Question.last_questions(params[:page])
    @answered = AnsweredQuestion.where(user: current_user)
  end
end
