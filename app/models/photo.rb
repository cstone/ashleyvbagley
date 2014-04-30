class Photo < ActiveRecord::Base
  attr_accessible :allow_comments, :description, :photo_image, :title
end
