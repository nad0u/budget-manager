class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uname
      t.string :email
      t.string :passw
      t.boolean :is_active
      t.boolean :is_blocked
      
      t.timestamps
    end
  end
end
