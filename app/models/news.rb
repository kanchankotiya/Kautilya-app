class News < ApplicationRecord
  validates_presence_of :title, :message => "Title must be required"
  validates_presence_of :description, :message => "Description must be required"
  validates_presence_of :category_id, :message => "category must be required"
  belongs_to :category, optional: :true
  mount_uploader :image, ImageUploader

  def previous
    News.where(["id < ?", id]).last
  end

  def next
    News.where(["id > ?", id]).first
  end
end
