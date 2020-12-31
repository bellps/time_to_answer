class Subject < ApplicationRecord
    searchkick
    has_many :questions
    paginates_per 20

    after_create :set_statistic

    private
    def set_statistic
        AdminStatistic.set_event(AdminStatistic::EVENTS[:total_subjects])
    end
end
