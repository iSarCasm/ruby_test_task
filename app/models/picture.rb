class Picture < ApplicationRecord
  mount_uploader :file, PictureUploader
end
