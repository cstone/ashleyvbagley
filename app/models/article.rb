class Article < ActiveRecord::Base
  attr_accessible :active, :allow_comments, :article_image, :body, :title
end
