class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :photo_image
      t.boolean :allow_comments

      t.timestamps
    end
  end
end
