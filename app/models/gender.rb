class Gender < ApplicationRecord
    belongs_to :user_profile, optional: true
end
