json.extract! student, :id, :given_name, :family_name, :email, :password, :password_confirmation, :created_at, :updated_at
json.url student_url(student, format: :json)
