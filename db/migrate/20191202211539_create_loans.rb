class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.boolean :accepted, :default => false
      t.boolean :returned
      t.integer :borrower_id
      t.integer :owner_id
      t.integer :tool_quantity
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
