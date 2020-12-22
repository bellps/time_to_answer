class UserStatistic < ApplicationRecord
  belongs_to :user

  # atributo virtual
  def total_questions
    self.right_questions + self.wrong_questions
  end

  #
    def self.set_statistic(answer, current_user)
        if !!current_user
            user_statistic = self.find_or_create_by(user: current_user)
            answer.correct? ? user_statistic.right_questions += 1 : user_statistic.wrong_questions += 1
            user_statistic.save
        end
    end
end
