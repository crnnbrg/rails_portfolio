class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :review, presence: true
end
