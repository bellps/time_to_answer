module ApplicationHelper
    def t_attribute(model = nil, attribute = nil)
        if model && attribute
            if model.is_a?(ActiveRecord::Relation)
                model.human_attribute_name(attribute)
            else
                model.class.human_attribute_name(attribute)
            end
        else
            "ERROR"
        end
    end

    def question_answered?(question)
        @answered.each do |a|
            if a.question_id === question.id
                return "(Respondida)"
            end
        end
        
        return nil
    end
end
