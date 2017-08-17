class AddSkillToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :skill, :string
  end
end
