class WelcomeController < ApplicationController

    def entrance

    end 

    def home
        @student=Student.find(session[:student_id])
        @team_loans = Team.find(@student.team_id).loans
        @pending_loans = @team_loans.where(accepted: false)
        @student_asked_loans = Loan.where(borrower_id: @student.id)
        @student_approved_loans = Loan.where(owner_id: @student.id).where(returned: nil)
        @finished_loans = @team_loans.where.not(returned: nil)

    end
end
        