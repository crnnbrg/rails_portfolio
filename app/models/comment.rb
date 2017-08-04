class Comment < ActiveRecord::Base
  belongs_to :project

  validates :review, presence: true
end
