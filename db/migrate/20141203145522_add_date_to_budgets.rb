class AddDateToBudgets < ActiveRecord::Migration
  def change
      add_column :budgets, :date_of_budget, :date, :default => Time.now
  end
end
