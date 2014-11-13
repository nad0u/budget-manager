class AddAmountToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :amount, :float
  end
end
