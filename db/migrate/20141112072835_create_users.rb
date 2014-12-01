class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.boolean :is_active
      t.boolean :is_blocked
      

      t.timestamps
    end
  end
end
