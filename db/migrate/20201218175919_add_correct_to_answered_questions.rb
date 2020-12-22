class AddCorrectToAnsweredQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :answered_questions, :correct, :boolean
  end
end
