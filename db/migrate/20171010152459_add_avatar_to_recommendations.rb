class AddAvatarToRecommendations < ActiveRecord::Migration[5.1]
  def change
    add_column :recommendations, :avatar, :string
  end
end
