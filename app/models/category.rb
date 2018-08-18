class Category < ApplicationRecord
  validates_presence_of :name, :message => " Category Name must be required"
  has_many :news, dependent: :destroy
  validates :name, presence:true
end
