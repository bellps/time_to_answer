class Answer < ApplicationRecord
    searchkick
    belongs_to :question, optional: true
end
