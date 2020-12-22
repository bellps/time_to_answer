class AdminsBackoffice::QuestionsController < AdminsBackofficeController
    before_action :set_question, only: [:edit, :update, :destroy, :show]
    before_action :get_subjects, only: [:new, :edit]

    def index
        @questions = Question.includes(:subject)
                             .order(:description)
                             .page(params[:page])
    end

    def show
    end

    def new 
        @question = Question.new
    end

    def create 
        @question = Question.new(question_params)
        if @question.save
            redirect_to admins_backoffice_questions_path, notice: t('messages.created', model: @question.model_name.human)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @question.update(question_params)
            redirect_to admins_backoffice_question_path(@question.id), notice: t('messages.edited', model: @question.model_name.human)
        else
            render :edit 
        end
    end

    def destroy
        if @question.destroy
            redirect_to admins_backoffice_questions_path, notice: t('messages.deleted', model: @question.model_name.human)
        else
            render :index 
        end
    end 

    private
    def question_params
        params.require(:question).permit(:description, :subject_id, 
                                         answers_attributes: [
                                             :id, :description, :correct, :_destroy
                                         ])
        
    end

    def set_question
        @question = Question.find(params[:id])

    end

    def get_subjects
        @all_subjects = Subject.all
    end

    # def check_nil
    #     @question.answers.each do |answer|
    #         if answer.description.size == 0
    #             answer[:_destroy] = '1'
    #         end
    #     end
    # end
end
