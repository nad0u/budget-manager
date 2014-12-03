class Budget < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  default_scope -> { order(date_of_budget: :desc) }
  #validates :name, :user_id, :amount, presence: true
  validates :name, :amount, :date_of_budget, presence: true
end
