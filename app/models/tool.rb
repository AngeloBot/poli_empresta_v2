class Tool < ApplicationRecord
	belongs_to :team
	has_many :loans, dependent: :destroy
	mount_uploader :photo, ImageUploader

	def self.search(search)
		if search
			where("name like ?", "%#{search}%")
		else
			all
		end
	end

	def self.available?(tool)
		tool.quantity > 0
	end

	validates_presence_of:name
	validates_presence_of:quantity
	validates_numericality_of:quantity ,allow_nil: true, greater_than: 0
end
