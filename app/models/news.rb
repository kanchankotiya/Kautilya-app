class News < ApplicationRecord
  belongs_to :category, optional: :true
  mount_uploader :image, ImageUploader

  def previous
    News.where(["id < ?", id]).last
  end

  def next
    News.where(["id > ?", id]).first
  end
end
