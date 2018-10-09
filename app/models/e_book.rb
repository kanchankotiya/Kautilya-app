class EBook < ApplicationRecord
  mount_uploader :cover_image, ImageUploader
  mount_uploader :main_file, PdfUploader
  mount_uploader :preview_file, PdfUploader
  validates_presence_of :title, :message => "Title must be required"
  validates_presence_of :description, :message => "Description must be required"
  validates_presence_of :cover_image, :message => "Image must be required"
  validates_presence_of :main_file, :message => "must be required"
  validates_presence_of :preview_file, :message => "must be required"
end
