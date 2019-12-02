class Team < ApplicationRecord
	has_many :tools, dependent: :destroy
	has_many :students, dependent: :destroy
	
	mount_uploader :photo, ImageUploader
	

	def self.search(search)
		if search
			where("name like ?", "%#{search}%")
		else
			all
		end
	end

end
