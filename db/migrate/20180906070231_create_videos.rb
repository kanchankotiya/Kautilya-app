class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :rails db:migrate
      t.string :description
      t.string :youtube_url

      t.timestamps
    end
  end
end
