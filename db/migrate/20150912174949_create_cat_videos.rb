class CreateCatVideos < ActiveRecord::Migration
  def change
    create_table :cat_videos do |t|
      t.string :link

      t.timestamps null: false
    end
  end
end
