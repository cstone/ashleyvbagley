class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :source
      t.boolean :allow_comments

      t.timestamps
    end
  end
end
