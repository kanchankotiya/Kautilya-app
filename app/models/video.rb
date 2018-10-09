class Video < ApplicationRecord
  validates_presence_of :title, :message => "Title must be required"
  validates_presence_of :description, :message => "Description must be required"
  validates_presence_of :youtube_url, :message => "Youtube_url must be required"
end
