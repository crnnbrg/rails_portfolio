class AddPhoneToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :verification_code, :string
    add_column :users, :is_verified, :boolean
  end
end
