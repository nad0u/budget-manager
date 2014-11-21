class Category < ActiveRecord::Base
    has_many :budgets, dependent: :nullify
    validates :name, presence: true
end
