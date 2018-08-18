class RemoveColumnFromNews < ActiveRecord::Migration[5.1]
  def change
    remove_column :news, :date, :string
  end
end
