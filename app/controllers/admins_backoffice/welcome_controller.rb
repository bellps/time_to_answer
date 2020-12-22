class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @total_questions = AdminStatistic.total_questions
    @total_users = AdminStatistic.total_users
    @total_subjects = AdminStatistic.total_subjects
  end
end
