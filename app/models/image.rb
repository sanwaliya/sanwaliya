class Image < ApplicationRecord
	mount_uploader :file, FileUploader
	belongs_to :imageable, polymorphic: true
end
