class Question < ApplicationRecord
    searchkick
    
    belongs_to :subject, counter_cache: true
    has_many :answers
    accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

    paginates_per 5

    after_create :set_statistic
    
    scope :search_questions, ->(search, page){
        includes(:answers, :subject)
                .where("lower(description) LIKE ?", "%#{search.downcase}%")
                .page(page)
    }

    scope :search_subject, ->(subject_id, page){
        includes(:answers)
                .where(subject_id: subject_id)
                .page(page)
    }

    scope :last_questions, ->(page){
        includes(:answers, :subject).order('created_at desc').page(page)
    }

    private
    def set_statistic
        AdminStatistic.set_event(AdminStatistic::EVENTS[:total_questions])
    end
end