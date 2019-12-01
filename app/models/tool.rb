class Tool < ApplicationRecord
  mount_uploader :photo, ImageUploader
end
