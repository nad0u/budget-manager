class ChangeAmountToDecimal < ActiveRecord::Migration
  def change
      change_column :budgets, :amount, :decimal
  end
end
