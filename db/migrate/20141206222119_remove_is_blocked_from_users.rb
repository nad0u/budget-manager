class RemoveIsBlockedFromUsers < ActiveRecord::Migration
  def change
      remove_column :users, :is_blocked, :boolean
  end
end
