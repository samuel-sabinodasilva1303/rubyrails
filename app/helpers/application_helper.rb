module ApplicationHelper
    
    def date_br(date_us)
        date_us.strftime("%d/%m/%Y")
    end
    
    def tipo_ambiente 
        if Rails.env.development?
            "desvolvimento"
        elsif Rails.env.production?
            "produção"
        else 
            "teste"
       end
     end 
            
end
