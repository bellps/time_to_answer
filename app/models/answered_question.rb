class AnsweredQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates_uniqueness_of :id, scope: %i[user_id question_id]
end
