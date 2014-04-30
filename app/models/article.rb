class Article < ActiveRecord::Base
  attr_accessible :article_image, :body, :title, :remove_article_image, :allow_comments

  mount_uploader :article_image, ArticleImageUploader

  #validations
  validates_presence_of :title, :body
  validates_uniqueness_of :title

  default_scope order('created_at DESC')
end
