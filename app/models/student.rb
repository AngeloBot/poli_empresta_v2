class Student < ApplicationRecord
	belongs_to :team
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

	validates_presence_of:given_name
	validates_presence_of:family_name
	
	validates_format_of:email, 
		with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
			message:"doesn't look like aproper email address"
	
	validates_uniqueness_of:email,case_sensitive: false,
		scope: [:given_name,:password],
		message:"has already been entered"
end
