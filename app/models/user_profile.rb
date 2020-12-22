class UserProfile < ApplicationRecord
    belongs_to :user, optional: true
    has_one :gender

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://digimedia.web.ua.pt/wp-content/uploads/2017/05/default-user-image.png"
    validates_attachment_content_type :avatar, content_type: ["image/jpeg", "image/gif", "image/png"]
end
