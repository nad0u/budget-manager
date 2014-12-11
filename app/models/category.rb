class Category < ActiveRecord::Base
    has_many :budgets, dependent: :nullify
    default_scope -> { order(name: :asc) }
    validates :name, presence: true
end
