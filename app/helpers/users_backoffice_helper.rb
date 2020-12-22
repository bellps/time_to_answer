module UsersBackofficeHelper
    # Um helper que checaria se o user tem avatar, e se não colocaria um placeholder
    # felizmente o paperclip faz isso sozinho no model do user_profile
    def avatar_url
        if current_user.user_profile.avatar.blank?
            "https://digimedia.web.ua.pt/wp-content/uploads/2017/05/default-user-image.png"
        else
            current_user.user_profile.avatar.url 
        end
    end
end
