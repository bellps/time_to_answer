class AdminMailer < ApplicationMailer
    def update_email(current_admin, edited_admin)
        @current_admin = current_admin
        @edited_admin = edited_admin

        mail(to: @edited_admin.email, subject: "Seus dados foram alterados")
    end

end
