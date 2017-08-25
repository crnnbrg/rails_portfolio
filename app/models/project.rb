class Project < ActiveRecord::Base
  has_many :comments, dependent: :delete_all
  validates :title, presence: true
  mount_uploader :picture, PictureUploader
end
