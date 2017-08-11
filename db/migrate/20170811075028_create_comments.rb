class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.column :review, :string
      t.column :vote, :integer
      t.column :project_id, :integer
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
