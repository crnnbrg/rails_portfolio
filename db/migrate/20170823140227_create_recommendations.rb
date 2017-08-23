class CreateRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations do |t|
      t.column :name, :string
      t.column :job_description, :string
      t.column :email, :string
      t.column :phone, :string

      t.timestamps
    end
  end
end
