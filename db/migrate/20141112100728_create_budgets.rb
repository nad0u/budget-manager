class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :name
      t.text :description
      t.boolean :is_expense
      t.references :category, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
