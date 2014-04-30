class Photo < ActiveRecord::Base
  attr_accessible :description, :photo_image, :title, :remove_photo_image, :allow_comments

  mount_uploader :photo_image, PhotosImageUploader


  #validations
  validates_presence_of :title, :description, :photo_image
end
