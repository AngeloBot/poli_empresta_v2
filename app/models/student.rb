class Student < ApplicationRecord
	mount_uploader :photo, ImageUploader
	has_secure_password

	def self.search(search)
		if search
			where("name like ?", "%#{search}%")
		else
			all
		end
	end

	def name
		given_name+" "+family_name
	end
end
