class AddReferenceToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :references, :team, index: true, foreign_key: true 
  end
end
