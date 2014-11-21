class AddFk < ActiveRecord::Migration
  def change
      change_column :users, :is_admin, :boolean, :default => false
      add_foreign_key(:budgets, :users)
      add_foreign_key(:budgets, :categories)
  end
end
