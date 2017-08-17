class Project < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true
  mount_uploader :picture, PictureUploader
end
