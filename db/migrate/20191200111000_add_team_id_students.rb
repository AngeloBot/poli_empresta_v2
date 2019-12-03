class AddTeamIdStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :team_id, :integer
  end
end
