class ChangeUsersColumn < ActiveRecord::Migration
  def change
      rename_column :users, :passw, :password_hash
      rename_column :users, :uname, :username
      add_column :users, :password_salt, :string
  end
end
