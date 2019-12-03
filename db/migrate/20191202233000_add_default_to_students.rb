class AddDefaultToStudents < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:students, :admin, false )
  end
end
