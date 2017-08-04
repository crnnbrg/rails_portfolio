class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.column :title, :string
      t.column :image, :string
      t.column :link, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
