class Page < ActiveRecord::Base
  attr_accessible :content, :title, :permalink, :page_image, :remove_page_image, :page_image_cache

  mount_uploader :page_image, PageImageUploader

  validates_uniqueness_of :permalink
  validates_presence_of :name, :permalink, :content

  def to_param
    permalink
  end
end
