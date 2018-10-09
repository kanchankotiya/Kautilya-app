class CreateEBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :e_books do |t|
      t.string :title
      t.text :description
      t.string :cover_image
      t.string :preview_file
      t.string :main_file

      t.timestamps
    end
  end
end
