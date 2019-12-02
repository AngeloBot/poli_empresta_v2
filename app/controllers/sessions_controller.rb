class SessionsController < ApplicationController
  def new
  end
  def create
    student = Student.find_by_email(params[:email])
    if student && student.authenticate(params[:password])
      session[:student_id] = student.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.notice = "Email or password is invalid"
      render "new"
    end
  end

  def destroy

    if session[:admin_pendente]
      team.session[:team].destroy
    end
    session[:student_id] = nil
    session[:created_team] = false
    session[:team] = nil
    session[:admin_pendente]=false
    redirect_to root_url, notice: "Logged out!"
  end

end
