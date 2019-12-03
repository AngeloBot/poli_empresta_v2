class AddPasswordToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :password, :string
  end
end
