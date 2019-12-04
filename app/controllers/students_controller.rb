class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.search(params[:search])
    @current_student = Student.find(session[:student_id])
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @team_loans = Team.find(@student.team_id).loans
    @pending_loans = @team_loans.where(accepted: false)
    @student_asked_loans = Loan.where(borrower_id: @student.id)
    @student_approved_loans = Loan.where(owner_id: @student.id).where(returned: nil)
    @finished_loans = @team_loans.where.not(returned: nil)
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create

    @student = Student.new(student_params)

    if @student.team_password == Team.find(@student.team_id).password
      respond_to do |format|
        if @student.save
          session[:student_id] = @student.id
          format.html { redirect_to home_path, notice: 'Student was successfully created.' }
          format.json { render :show, status: :created, location: @student }

          #redirect_to root_url, notice: "Thank you for signing up!"
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }

        #save
        end
      #respond
      end
    #if password
    else
      redirect_to new_student_path
    end

  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:given_name, :family_name, :email, :password, :password_confirmation, :photo, :admin, :team_id, :team_password)
    end
end
