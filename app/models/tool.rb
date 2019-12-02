class Tool < ApplicationRecord
	belongs_to :team
	mount_uploader :photo, ImageUploader

	def self.search(search)
		if search
			where("name like ?", "%#{search}%")
		else
			all
		end
	end


end
