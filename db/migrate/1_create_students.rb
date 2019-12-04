class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :given_name
      t.string :family_name
      t.string :email
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
