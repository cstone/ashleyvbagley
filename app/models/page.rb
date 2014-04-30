class Page < ActiveRecord::Base
  attr_accessible :content, :name, :permalink, :page_image, :remove_page_image

  mount_uploader :page_image, PageImageUploader

  validates_uniqueness_of :permalink
  validates_presence_of :name, :permalink, :content

  def to_param
    permalink
  end
end
