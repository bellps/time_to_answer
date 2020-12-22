class AdminsBackoffice::AdminsController < AdminsBackofficeController
    before_action :set_admin, only: [:edit, :update, :destroy]
    before_action :verify_password, only: [:update]

    def index
        @admins = Admin.all.page(params[:page])
    end

    def new 
        @admin = Admin.new
    end

    def create 
        @admin = Admin.new(admin_params)
        if @admin.save
            redirect_to admins_backoffice_admins_path, notice: t('messages.created', model: @admin.model_name.human)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @admin.update(admin_params)
            AdminMailer.update_email(current_admin, @admin).deliver_now
            redirect_to admins_backoffice_admins_path, notice: t('messages.edited', model: @admin.model_name.human)
        else
            render :edit
        end
    end

    def destroy
        if @admin.destroy
            redirect_to admins_backoffice_admins_path, notice: t('messages.deleted', model: @admin.model_name.human)
        else
            render :index 
        end
    end 

    private
    def verify_password
        if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
            params[:admin].extract!(:password, :password_confirmation)
        end
    end

    def admin_params
        params.require(:admin).permit(:email, :password, :password_confirmation)
    end

    def set_admin
        @admin = Admin.find(params[:id])
    end
end
