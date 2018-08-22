class AddFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile_no, :string
  end
end
