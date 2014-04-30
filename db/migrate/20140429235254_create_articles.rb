class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :article_image
      t.boolean :allow_comments
      t.boolean :active

      t.timestamps
    end
  end
end
