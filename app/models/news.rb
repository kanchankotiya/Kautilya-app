class News < ApplicationRecord
  validates_presence_of :title, :message => "Title must be required"
  validates_presence_of :description, :message => "Description must be required"
  validates_presence_of :image, :message => "Image must be required"
  validates_presence_of :category, :message => "category must be required"
  belongs_to :category, optional: :true
  mount_uploader :image, ImageUploader
  paginates_per 10
  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

  def previous
    News.where(["id < ?", id]).last
  end

  def next
    News.where(["id > ?", id]).first
  end
end
