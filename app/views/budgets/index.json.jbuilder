json.array!(@budgets) do |budget|
  json.extract! budget, :id, :name, :description, :is_expense
  json.url budget_url(budget, format: :json)
end
