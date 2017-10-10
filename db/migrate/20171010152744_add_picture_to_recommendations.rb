class AddPictureToRecommendations < ActiveRecord::Migration[5.1]
  def change
    add_column :recommendations, :picture, :string
  end
end
