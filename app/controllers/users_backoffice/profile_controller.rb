class UsersBackoffice::ProfileController < UsersBackofficeController
    before_action :get_user, only: [:edit, :update]
    before_action :get_genders, only: [:edit, :update]
    before_action :verify_password, only: [:update]
    before_action :verify_avatar, only: [:update]

    def edit
        @user.build_user_profile if @user.user_profile.blank?
    end

    def update
        if @user.update(user_params)
            bypass_sign_in(@user)
            redirect_to request.referer, notice: t('messages.edited', model: @user.model_name.human)
        else
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password,
                                     :password_confirmation, user_profile_attributes: [
                                                                :id,
                                                                :avatar,
                                                                :address,
                                                                :zip_code,
                                                                :birthdate, 
                                                                :gender_id
                                    ])
    end

    def verify_password
        if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
            params[:user].extract!(:password, :password_confirmation)
        end
    end

    def verify_avatar
        if params[:user][:user_profile_attributes][:avatar].blank? 
            params[:user].extract!(user_profile_attributes: [:avatar])
        end
    end

    def get_user
        @user = User.find(current_user.id)
    end
    
    def get_genders
        @genders = Gender.all
    end
end
