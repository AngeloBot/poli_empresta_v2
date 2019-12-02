json.extract! loan, :id, :accepted, :returned, :borrower_id, :owner_id, :tool_quantity, :start, :end, :created_at, :updated_at
json.url loan_url(loan, format: :json)
