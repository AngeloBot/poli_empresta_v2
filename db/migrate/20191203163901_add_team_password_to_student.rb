class AddTeamPasswordToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :team_password, :string
  end
end
