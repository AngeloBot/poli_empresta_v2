class WelcomeController < ApplicationController

    def entrance

    end 

    def home
        @student=Student.find(session[:student_id])

    end
end
        