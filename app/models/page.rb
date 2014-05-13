class Page < ActiveRecord::Base
  attr_accessible :content, :title, :permalink, :page_image, :remove_page_image, :page_image_cache

  mount_uploader :page_image, PageImageUploader

  validates_uniqueness_of :permalink
  validates_presence_of :title, :permalink, :content

  def self.get_content permalink
    page = Page.where(permalink: permalink).first
    return page.content if !page.nil?
    return "Content missing for key #{permalink}"
  end

  def self.get_title permalink
    page = Page.where(permalink: permalink).first
    return page.title if !page.nil?
    return "Title missing for key #{permalink}"
  end

  def to_param
    permalink
  end
end
