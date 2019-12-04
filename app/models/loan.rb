class Loan < ApplicationRecord
  belongs_to :tool

  validates_presence_of:tool_quantity
	validates_numericality_of:tool_quantity ,allow_nil: true,
		greater_than: 0

	validates_inclusion_of:start,
		in: Date.today .. Date.civil(2040, 1, 1), 
			message:"Star must be from today"

	validates_inclusion_of:end,
		in: Date.today .. Date.civil(2040, 1, 1), 
			message:"End must be from today"

end
