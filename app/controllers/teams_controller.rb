class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index

    Team.all.each do |team|
    	if team.students.empty?
    	  team.destroy
    	end
    end

    @teams = Team.search(params[:search])
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @student= Student.find(session[:student_id])
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
    @student = Student.find(session[:student_id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to new_student_path }
        format.json { render :show, status: :created, location: @team }
        session[:created_team] = 1
        session[:team] = @team.id
        session[:admin_pendente] = true
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        @student=Student.find(session[:student_id])
        format.html { redirect_to team_path(@student.team_id), notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :description, :photo)
    end
end
