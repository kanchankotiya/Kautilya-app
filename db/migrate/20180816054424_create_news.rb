class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :image
      t.text :description
      t.string :title
      t.date :date
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
