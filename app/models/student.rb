class Student < ApplicationRecord
	mount_uploader :photo, ImageUploader
	has_secure_password
end
