class Video < ActiveRecord::Base
  attr_accessible :allow_comments, :description, :source, :title

  validates_presence_of :title, :description, :source

  default_scope order('created_at DESC')
end
